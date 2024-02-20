#!/bin/bash

# This script adds aliases and a custom PS1 prompt to your ~/.bashrc for a better bash experience.

echo "Adding aliases..."

# Add alias for 'vi' if it doesn't exist
if ! grep -q "alias vi=" ~/.bashrc; then
    echo "alias vi='nvim'" >> ~/.bashrc
    echo "Alias for vi -> nvim added."
else
    echo "Alias for vi already exists, skipping..."
fi

# Add alias for 'vim' if it doesn't exist
if ! grep -q "alias vim=" ~/.bashrc; then
    echo "alias vim='nvim'" >> ~/.bashrc
    echo "Alias for vim -> nvim added."
else
    echo "Alias for vim already exists, skipping..."
fi

# Add alias for 'LS' if it doesn't exist
if ! grep -q "alias LS=" ~/.bashrc; then
    echo "alias LS='ls'" >> ~/.bashrc
    echo "Alias for LS -> ls added."
else
    echo "Alias for LS already exists, skipping..."
fi

# Add alias for 'vpnuoe' if it doesn't exist
if ! grep -q "alias vpnuoe=" ~/.bashrc; then
    echo "alias vpnuoe='sudo openfortivpn remote.net.ed.ac.uk:8443 -u s2223191'" >> ~/.bashrc
    echo "Alias for 'vpnuoe' added."
else
    echo "Alias for 'vpnuoe' already exists, skipping..."
fi

# Git related aliases
if ! grep -q "alias gaa=" ~/.bashrc; then
    echo "alias gaa='git add --all'" >> ~/.bashrc
    echo "Alias for 'gaa' -> 'git add --all' added."
else
    echo "Alias for 'gaa' already exists, skipping..."
fi

if ! grep -q "alias gcmsg=" ~/.bashrc; then
    echo "alias gcmsg='git commit -m'" >> ~/.bashrc
    echo "Alias for 'gcmsg' -> 'git commit -m' added."
else
    echo "Alias for 'gcmsg' already exists, skipping..."
fi

if ! grep -q "alias ga=" ~/.bashrc; then
    echo "alias ga='git add'" >> ~/.bashrc
    echo "Alias for 'ga' -> 'git add' added."
else
    echo "Alias for 'ga' already exists, skipping..."
fi

if ! grep -q "alias gst=" ~/.bashrc; then
    echo "alias gst='git status'" >> ~/.bashrc
    echo "Alias for 'gst' -> 'git status' added."
else
    echo "Alias for 'gst' already exists, skipping..."
fi

if ! grep -q "alias gp=" ~/.bashrc; then
    echo "alias gp='git push'" >> ~/.bashrc
    echo "Alias for 'gp' -> 'git push' added."
else
    echo "Alias for 'gp' already exists, skipping..."
fi

echo "Adding bash prompt beautification configuration..."

# Backup current .bashrc file
cp ~/.bashrc ~/.bashrc.backup

# Add custom PS1 prompt if it doesn't exist
if ! grep -q "PS1='\e\[0;31m\]" ~/.bashrc; then
    echo "export PS1='\e[0;31m\]\342\224\214\342\224\200\e[1;32m\][\e[1m\]\e[3;35m\]\u\e[0m\]@\e[1;33m\]\H\e[1;32m\]][\e[1;34m\]\t\e[1;32m\]] \e[1;30m\]\e[3;30m\]\$PWD\e[0m\]\n\e[0;31m\]\342\224\224\342\224\200\342\224\200\342\225\274 \e[0m\]\$ '" >> ~/.bashrc
    echo "Bash prompt beautification configuration added."
else
    echo "Bash prompt beautification configuration already exists, skipping..."
fi

# extract command with alias x
extract () {
    if [ -z "$1" ]; then
        echo "Usage: extract <path/file>"
        return 1
    fi
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

alias x='extract'


echo "Please run 'source ~/.bashrc' to apply changes or re-login."
