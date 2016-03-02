#!/bin/bash
sudo npm install -g js-beautify
git submodule init
git submodule update --recursive
cd bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --tern-completer