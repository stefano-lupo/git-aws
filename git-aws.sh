#!/bin/bash
# directory=${PWD##*/}

aws_git_dir="/var/git-aws"

command=$1
name=$2

if [ -z $command ] || [ -z $name ]
then
  echo "Missing arguments.."
  exit
fi

if [ "$command" = "clone" ]
then
  echo "Cloning.."
  git clone "ubuntu@aws:$aws_git_dir/$name"
  exit
fi

if [ "$command" = "init" ]
then
  ssh aws "mkdir $aws_git_dir/${name} && git init --bare $aws_git_dir/${name}"
  git init
  git remote add origin ubuntu@aws:$aws_git_dir/${name}
  echo "Set up remote as:"
  git remote -v
  exit
fi

echo "Bad news buddy"