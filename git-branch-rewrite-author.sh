#!/bin/sh

usage() {
    echo "Usage: git-branch-rewrite-author.sh <name> <email>"
    exit 1
}

name="$1"
if [ -z "$name" ]; then
    name=`git config --local --get user.name`
fi
if [ -z "$name" ]; then
    usage
fi

email="$2"
if [ -z "$email" ]; then
    email=`git config --local --get user.email`
fi
if [ -z "$email" ]; then
    usage
fi

echo "Rewriting author to $name <$email> ..."

git filter-branch -f --env-filter "GIT_AUTHOR_NAME='$name'; GIT_AUTHOR_EMAIL='$email'; GIT_COMMITTER_NAME='$name'; GIT_COMMITTER_EMAIL='$email';" HEAD