#!/bin/bash
git submodule init
git submodule update --recursive
cd bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --tern-completer