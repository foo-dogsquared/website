#!/bin/bash

# Deploys the Hugo build into GitHub Pages.

# ANSI color codes
red="\u001b[31m"
green="\u001b[32m"
reset="\u001b[0m"

error_log() {
    printf "$red An error occurred on line $1\n $reset"
}

target_branch="gh-pages"
default_branch="master"
main_remote_alias="origin"
build_directory="public/"

trap 'error_log $LINENO' ERR

# Cleaning up the build site
printf "Deleting older version of the site"
rm -rf $build_directory
mkdir $build_directory

git worktree prune
rm -rf .git/worktrees/$build_directory

# Building the worktree for the target branch
# https://git-scm.com/docs/git-worktree
echo "Checking out $target_branch branch into public"
git worktree add -B $target_branch $public $main_remote_alias/$target_branch

# Building the site
printf "Building the site"
hugo

# Pushing the build into the pages branch
printf "$green -> Deploying page to GitHub...$reset\n"
cd $build_directory   
git add --all
git commit -m "Deploying site to branch $target_branch."

git push --force $main_remote_alias $target_branch
