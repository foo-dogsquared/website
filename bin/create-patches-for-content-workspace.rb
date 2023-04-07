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

# Setting things for the application...
CONTENT_DIRECTORY = 'content'
PATCHES_SUBDIRECTORY = 'assets/patches'
options = {
  'current-branch': false,
  prefix: 'content/',
  repo: '.',
  branches: []
}

logger = Logger.new($stdout)
logger.level = Logger::WARN

# And then immediately run with the argument parser.
OptionParser.new do |opts|
  opts.on('-c', '--current-branch', 'Select the current branch.') do
    options[:'current-branch'] = true
  end

  opts.on('-p', '--prefix PREFIX',
          <<~HELP
            Sets the prefix corresponding to a subdirectory inside
            the content directory.
          HELP
  ) do |prefix|
    options[:prefix] = prefix
  end

  opts.on('-b', '--branches a,b,c', 'List of branches to be generated') do |branches|
    options[:branches].push *branches
  end

  opts.on('--repo REPO', String, 'Select the Git repository of the workspace') do |repo|
    options[:repo] = repo
  end

  opts.on('-v', '--[no-]verbose', 'Make the program print results') do |v|
    options[:verbose] = v
  end
end.parse!

logger.level = Logger::INFO if options[:verbose]

code_workspace = Rugged::Repository.discover(options[:repo])

# Filtering the branches to be processed before iterating each of them for the patch creation.
options[:branches].select! do |branch|
  start_with_prefix = branch.start_with? options[:prefix]
  logger.warn "Branch '#{branch}' does not start in '#{options[:prefix]}'. Ignoring." unless start_with_prefix

  start_with_prefix
end

if options[:'current-branch']
  selected_branch = code_workspace.branches[code_workspace.head.name].name

  raise %(Current branch is not a '#{options[:prefix]}' subbranch.) unless selected_branch.start_with? options[:prefix]

  options[:branches].push selected_branch
end

if options[:branches].empty?
  branches = code_workspace.branches
                           .each_name(:local)
                           .select { |branch| branch.start_with? options[:prefix] }
                           .sort

  raise "No branches with the prefix '#{options[:prefix]}'" if branches.empty?

  options[:branches] = `echo -e "#{branches.join '\n'}" | fzf --multi`.strip.split("\n")
end

# Creating a walker for the commits of each branch. The walker can be reused by
# setting the branches reference as a starting point. I don't see any setback
# with this approach yet.
repo_walker = Rugged::Walker.new(code_workspace)
repo_walker.sorting(Rugged::SORT_REVERSE)

# The branches at this point should have been filtered with the given prefix.
options[:branches].each do |branch|
  selected_branch_object = code_workspace.branches[branch]
  content_location = branch.delete_prefix options[:prefix]
  repo_walker.push(selected_branch_object.target_id)

  # Delete the patches directory. This makes it completely dangerous.
  patches_dir = File.expand_path("#{content_location}/#{PATCHES_SUBDIRECTORY}", CONTENT_DIRECTORY)

  FileUtils.rmtree(patches_dir, secure: true)
  logger.info "Removing '#{patches_dir}'"

  FileUtils.mkdir_p(patches_dir)
  logger.info "Creating directory '#{patches_dir}'"

  # Write the patch into the designated patches directory. Take note the branch
  # should have the corresponding subdirectory in the content directory.
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
end
