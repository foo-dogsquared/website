#!/usr/bin/env nix-shell
#! nix-shell -i ruby -p "ruby.withPackages (ps: with ps; [ rugged ])" coreutils fzf

# frozen_string_literal: true

# A script that recreates `git format-patch` subcommand but with a few more
# specific use case for this project.
require 'fileutils'
require 'logger'
require 'optparse'
require 'rugged'

def to_kebab_case(string)
  string.gsub(/\s+/, '-')           # Replace all spaces with dashes.
        .gsub(/[^a-zA-Z0-9-]/, '')  # Remove all non-alphanumerical (and dashes) characters.
        .gsub(/-+/, '-')            # Reduce all dashes into only one.
        .gsub(/^-|-+$/, '')         # Remove all leading and trailing dashes.
        .downcase
end

CONTENT_DIRECTORY = 'content'
PATCHES_SUBDIRECTORY = 'assets/patches'
options = {
  'current-branch': false,
  'prefix': 'posts/',
  'repo': '.'
}

logger = Logger.new($stdout)
logger.level = Logger::WARN

OptionParser.new do |opts|
  opts.on('-c', '--current-branch', 'Select the current branch.') do
    options['current-branch'] = true
  end

  opts.on('-p', '--prefix PREFIX',
          <<~HELP
            Sets the prefix corresponding to a subdirectory inside
            the content directory.
          HELP
  ) do |prefix|
    options['prefix'] = prefix
  end

  opts.on('--repo REPO', String, 'Select the Git repository of the workspace') do |repo|
    options['repo'] = repo
  end

  opts.on('-v', '--[no-]verbose', 'Make the program print results') do |v|
    options['verbose'] = v
  end
end.parse!

logger.level = Logger::INFO if options['verbose']

code_workspace = Rugged::Repository.discover(options['repo'])
if options['current-branch']
  selected_branch = code_workspace.branches[code_workspace.head.name].name
  raise %(Current branch is not a '#{options['prefix']}' subbranch.) unless selected_branch.start_with? options[:prefix]
else
  branches = code_workspace.branches
                           .each_name(:local)
                           .select { |branch| branch.start_with? options[:prefix] }
                           .sort

  raise "No branches with the prefix '#{options['prefix']}'" if branches.empty?

  selected_branch = `echo -e "#{branches.join '\n'}" | fzf`.strip
end

selected_branch_object = code_workspace.branches[selected_branch]

repo_walker = Rugged::Walker.new(code_workspace)
repo_walker.push(selected_branch_object.target_id)
repo_walker.sorting(Rugged::SORT_DATE | Rugged::SORT_REVERSE)

# Delete the patches directory. This makes it completely dangerous.
patches_dir = File.expand_path("#{selected_branch}/#{PATCHES_SUBDIRECTORY}", CONTENT_DIRECTORY)

FileUtils.rmtree(patches_dir, secure: true)
logger.info "Removing '#{patches_dir}'"

FileUtils.mkdir_p(patches_dir)
logger.info "Creating directory '#{patches_dir}'"

repo_walker.each_with_index do |commit, index|
  commit_message = to_kebab_case commit.message
  commit_index = (index + 1).to_s.rjust(4, '0')

  patchfile = File.expand_path(
    "#{commit_index}-#{commit_message}.patch",
    patches_dir
  )

  File.open(patchfile, 'w') do |f|
    logger.info "Creating patch file '#{patchfile}' from commit '#{commit.tree_id}'"
    f.write commit.diff.patch
  end
end
