#!/usr/bin/env bash

source ./scripts/format.sh

dotvim_personal="$HOME/.dotvim.d"
cache_vim="$HOME/.cache/vim"
generator="$HOME/.config/nvim/bin/generator"

action "Running Clean up..."

running "Remove the .dotvim.d folder"
rm -rf dotvim_personal

running "Remove the plugins install folder"
rm -rf cache_vim

ok "Clean up Success"