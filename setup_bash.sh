#!/bin/bash

# This script adds aliases and a custom PS1 prompt to your ~/.bashrc for a better bash experience.

echo "Adding aliases..."

# Add alias for 'vi' if it doesn't exist
if ! grep -q "alias vi=" ~/.bashrc; then
	echo "alias vi='nvim'" >>~/.bashrc
	echo "Alias for vi -> nvim added."
else
	echo "Alias for vi already exists, skipping..."
fi

# Add alias for 'nv' if it doesn't exist
Add alias for 'nv' if it doesn't exist
if ! grep -q "alias nv=" ~/.bashrc; then
	echo "alias nv='nvim'" >>~/.bashrc
	echo "Alias for nv -> nvim added."
else
	echo "Alias for nv already exists, skipping..."
fi

# Add alias for 'vim' if it doesn't exist
if ! grep -q "alias vim=" ~/.bashrc; then
	echo "alias vim='nvim'" >>~/.bashrc
	echo "Alias for vim -> nvim added."
else
	echo "Alias for vim already exists, skipping..."
fi

# Add alias for 'LS' if it doesn't exist
if ! grep -q "alias LS=" ~/.bashrc; then
	echo "alias LS='ls'" >>~/.bashrc
	echo "Alias for LS -> ls added."
else
	echo "Alias for LS already exists, skipping..."
fi

# Check if an alias for 'r' already exists in ~/.bashrc
if ! grep -q "alias r=" ~/.bashrc; then
	# If it doesn't exist, add an alias for 'r' to use 'ranger'
	echo "alias r='ranger'" >>~/.bashrc
	echo "Alias for r -> ranger added."
else
	# If the alias already exists, skip adding it
	echo "Alias for r already exists, skipping..."
fi

# Check if an alias for 'R' already exists in ~/.bashrc
if ! grep -q "alias R=" ~/.bashrc; then
	# If it doesn't exist, add an alias for 'R' to use 'ranger'
	echo "alias R='ranger'" >>~/.bashrc
	echo "Alias for R -> ranger added."
else
	# If the alias already exists, skip adding it
	echo "Alias for R already exists, skipping..."
fi

# Check if an alias for 'CD' already exists in ~/.bashrc
if ! grep -q "alias CD=" ~/.bashrc; then
	# If it doesn't exist, add an alias for 'CD' to use 'cd'
	echo "alias CD='cd'" >>~/.bashrc
	echo "Alias for CD -> cd added."
else
	# If the alias already exists, skip adding it
	echo "Alias for CD already exists, skipping..."
fi

# Add alias for 'vpnuoe' if it doesn't exist
if ! grep -q "alias vpnuoe=" ~/.bashrc; then
	echo "alias vpnuoe='sudo openfortivpn remote.net.ed.ac.uk:8443 -u s2223191'" >>~/.bashrc
	echo "Alias for 'vpnuoe' added."
else
	echo "Alias for 'vpnuoe' already exists, skipping..."
fi

# Git related aliases
if ! grep -q "alias gaa=" ~/.bashrc; then
	echo "alias gaa='git add --all'" >>~/.bashrc
	echo "Alias for 'gaa' -> 'git add --all' added."
else
	echo "Alias for 'gaa' already exists, skipping..."
fi

if ! grep -q "alias gcm=" ~/.bashrc; then
	echo "alias gcm='git commit -m'" >>~/.bashrc
	echo "Alias for 'gcm' -> 'git commit -m' added."
else
	echo "Alias for 'gcm' already exists, skipping..."
fi

if ! grep -q "alias ga=" ~/.bashrc; then
	echo "alias ga='git add'" >>~/.bashrc
	echo "Alias for 'ga' -> 'git add' added."
else
	echo "Alias for 'ga' already exists, skipping..."
fi

if ! grep -q "alias gst=" ~/.bashrc; then
	echo "alias gst='git status'" >>~/.bashrc
	echo "Alias for 'gst' -> 'git status' added."
else
	echo "Alias for 'gst' already exists, skipping..."
fi

if ! grep -q "alias gp=" ~/.bashrc; then
	echo "alias gp='git push'" >>~/.bashrc
	echo "Alias for 'gp' -> 'git push' added."
else
	echo "Alias for 'gp' already exists, skipping..."
fi

echo "Adding bash prompt beautification configuration..."

# Backup current .bashrc file
cp ~/.bashrc ~/.bashrc.backup

# Add custom PS1 prompt if it doesn't exist
#if ! grep -q "PS1='\e\[0;31m\]" ~/.bashrc; then
#	echo "export PS1='\e[0;31m\]\342\224\214\342\224\200\e[1;32m\][\e[1m\]\e[3;35m\]\u\e[0m\]@\e[1;33m\]\H\e[1;32m\]][\e[1;34m\]\t\e[1;32m\]] \e[1;30m\]\e[3;30m\]\$PWD\e[0m\]\n\e[0;31m\]\342\224\224\342\224\200\342\224\200\342\225\274 \e[0m\]\$ '" >>~/.bashrc

#	echo "Bash prompt beautification configuration added."
#else
#	echo "Bash prompt beautification configuration already exists, skipping..."
#fi

echo "Adding extract and its alias x for one-key extraction..."

# Check if extract function already exists
if ! grep -q "extract ()" ~/.bashrc; then
	echo "Adding extract function..."
	cat >>~/.bashrc <<'EOF'

extract () {
    if [ -z "$1" ]; then
        echo "Usage: extract <path/file>"
        return 1
    fi
    case $1 in
        *.tar.bz2) tar xjf $1 ;;
        *.tar.gz)  tar xzf $1 ;;
        *.bz2)     bunzip2 $1 ;;
        *.rar)     unrar x $1 ;;
        *.gz)      gunzip $1 ;;
        *.tar)     tar xf $1 ;;
        *.tbz2)    tar xjf $1 ;;
        *.tgz)     tar xzf $1 ;;
        *.zip)     unzip $1 ;;
        *.Z)       uncompress $1 ;;
        *.7z)      7z x $1 ;;
        *)         echo "Don't know how to extract '$1'..." ;;
    esac
}

alias x='extract'
EOF
	echo "extract function and alias x added."
else
	echo "extract function and alias x already exists, skipping..."
fi

echo "Please run 'source ~/.bashrc' to apply changes or re-login."
export EDITOR ='nvim'
