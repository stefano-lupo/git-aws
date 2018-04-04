#!/bin/bash

aws_git_dir="/var/git-aws/*/.git"

inotifywait -m $aws_git_dir -e modify -e create -e moved_to |
    while read path action file; do
        echo "The file '$file' appeared in directory '$path' via '$action'"
        # do something with the file
    done