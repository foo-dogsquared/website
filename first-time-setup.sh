#!/bin/bash

# Deploys the Hugo build into GitHub Pages.

# ANSI color codes
red="\u001b[31m"
green="\u001b[32m"
reset="\u001b[0m"

error_log() {
    printf "$red An error occurred on line $1.\n"
}

target_branch="gh-pages"
default_branch="master"
main_remote_alias="origin"
build_directory="public/"

printf "$green -> Setting up first time things...$reset\n"

trap 'error_log $LINENO' ERR

# Creating orphan branch for the site
git checkout --orphan $target_branch

# Reset the branch while retaining the files
git reset --hard

# Initialize the branch
git commit --allow-empty -m "Initializing $target_branch branch"

# Pushing the branch into origin
git push --force $main_remote_alias $target_branch
git checkout $default_branch

# Cleaning up the build site first
rm -rf $build_directory

# Adding a worktree for the target branch and setting it to origin
git worktree add -B $target_branch $build_directory $main_remote_alias/$target_branch
