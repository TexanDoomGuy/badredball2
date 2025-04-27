#!/bin/sh
echo -ne '\033c\033]0;Bad Red Ball 2\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Bad Red Ball 2.x86_64" "$@"
