#!/bin/sh

usage() {
    echo "Usage: git-amend-rewrite-author.sh <name> <email>"
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

git commit --amend --author "\"$name\" <$email>\""