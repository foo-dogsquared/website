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

trap 'error_log $LINENO' ERR

# Cleaning up the build site
printf "Deleting older version of the site"
rm -rf public/
mkdir public/

git worktree prune
rm -rf .git/worktrees/public/

# Building the site
printf "Building the site"
hugo

# Pushing the build into the pages branch
printf "$green -> Deploying page to GitHub...$reset\n"
cd public   
git add --all
git commit -m "Deploying site to branch $target_branch."

git push origin $target_branch
