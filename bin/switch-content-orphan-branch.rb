#!/usr/bin/env nix-shell
#! nix-shell -i ruby -p "ruby.withPackages (ps: with ps; [ rugged ])" coreutils fzf

# frozen_string_literal: true

require 'fileutils'
require 'logger'
require 'optparse'
require 'rugged'

CONTENT_DIRECTORY = 'content'

options = {
  prefix: 'content/',
  repo: './code-workspace'
}
logger = Logger.new($stdout)
logger.level = Logger::WARN

OptionParser.new do |opts|
  opts.on('-p', '--prefix PREFIX',
          <<~HELP
            Sets the prefix corresponding to a subdirectory inside
            the content directory.
          HELP
  ) do |prefix|
    options[:prefix] = prefix
  end

  opts.on('--repo REPO', 'The repository location.') do |repo|
    options[:repo] = repo
  end

  opts.on('-v', '--[no-]verbose', 'Make the program print results') do |v|
    options[:verbose] = v
  end
end.parse!

logger.level = Logger::INFO if options[:verbose]

files = Dir.glob('**/', base: CONTENT_DIRECTORY)
           .select { |file| File.directory?(File.expand_path(file, CONTENT_DIRECTORY)) }

selected_branch = `echo -e "#{files.join '\n'}" | fzf`.strip.delete_suffix '/'

code_workspace = Rugged::Repository.discover(options[:repo])
code_workspace.head=("refs/heads/#{options[:prefix]}#{selected_branch}")
logger.info "Switched '#{options[:repo]}' to orphan branch '#{code_workspace}'"
