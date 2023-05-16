#!/usr/bin/env bash

set -e

stow local -t ~/.local
stow config -t ~/.config
stow home -t ~
