#!/usr/bin/env fish

# This script adds aliases and other configurations to your fish shell.

set -l CONFIG_FILE "$HOME/.config/fish/config.fish"

# Add alias only if it doesn't exist
function add_alias
    set -l alias_cmd "$argv[1]"
    set -l alias_text "$argv[2]"

    if not grep -q "$alias_cmd" "$CONFIG_FILE"
        echo "Adding alias: $alias_cmd -> $alias_text"
        echo "$alias_cmd" >>"$CONFIG_FILE"
    else
        echo "Alias $alias_cmd already exists, skipping..."
    end
end

# Define aliases
add_alias "alias nv='nvim'" "nv -> nvim"
add_alias "alias LS='ls'" "LS -> ls"
add_alias "alias r='ranger'" "r -> ranger"
add_alias "alias R='ranger'" "R -> ranger"
add_alias "alias CD='cd'" "CD -> cd"
add_alias "alias vpnuoe='sudo openfortivpn remote.net.ed.ac.uk:8443 -u s2223191'" "vpnuoe -> openfortivpn"

# Git-related aliases
add_alias "alias gaa='git add --all'" "gaa -> git add --all"
add_alias "alias gcm='git commit -m'" "gcm -> git commit -m"
add_alias "alias ga='git add'" "ga -> git add"
add_alias "alias gst='git status'" "gst -> git status"
add_alias "alias gp='git push'" "gp -> git push"

# Extract function and its alias
if not grep -q "function extract" "$CONFIG_FILE"
    echo "Adding extract function and its alias..."
    echo "function extract" >>"$CONFIG_FILE"
    echo "  if test -z \"\$argv\"" >>"$CONFIG_FILE"
    echo "      echo 'Usage: extract <path/file>'" >>"$CONFIG_FILE"
    echo "      return 1" >>"$CONFIG_FILE"
    echo "  end" >>"$CONFIG_FILE"
    echo "  switch \$argv[1]" >>"$CONFIG_FILE"
    echo "      case '*.tar.bz2'" >>"$CONFIG_FILE"
    echo "          tar xjf \$argv[1]" >>"$CONFIG_FILE"
    echo "      case '*.tar.gz'" >>"$CONFIG_FILE"
    echo "          tar xzf \$argv[1]" >>"$CONFIG_FILE"
    echo "      case '*.bz2'" >>"$CONFIG_FILE"
    echo "          bunzip2 \$argv[1]" >>"$CONFIG_FILE"
    echo "      case '*.rar'" >>"$CONFIG_FILE"
    echo "          unrar x \$argv[1]" >>"$CONFIG_FILE"
    echo "      case '*.gz'" >>"$CONFIG_FILE"
    echo "          gunzip \$argv[1]" >>"$CONFIG_FILE"
    echo "      case '*.tar'" >>"$CONFIG_FILE"
    echo "          tar xf \$argv[1]" >>"$CONFIG_FILE"
    echo "      case '*.tbz2'" >>"$CONFIG_FILE"
    echo "          tar xjf \$argv[1]" >>"$CONFIG_FILE"
    echo "      case '*.tgz'" >>"$CONFIG_FILE"
    echo "          tar xzf \$argv[1]" >>"$CONFIG_FILE"
    echo "      case '*.zip'" >>"$CONFIG_FILE"
    echo "          unzip \$argv[1]" >>"$CONFIG_FILE"
    echo "      case '*.Z'" >>"$CONFIG_FILE"
    echo "          uncompress \$argv[1]" >>"$CONFIG_FILE"
    echo "      case '*.7z'" >>"$CONFIG_FILE"
    echo "          7z x \$argv[1]" >>"$CONFIG_FILE"
    echo "      case '*'" >>"$CONFIG_FILE"
    echo "          echo 'Don't know how to extract '\$argv[1]'" >>"$CONFIG_FILE"
    echo "  end" >>"$CONFIG_FILE"
    echo end >>"$CONFIG_FILE"
    echo "alias x='extract'" >>"$CONFIG_FILE"
end

# FZF configuration
set -l FZF_CONFIG "set -x FZF_DEFAULT_OPTS \"--height 100% --layout=reverse --info inline --border --preview 'cat {}' --preview-window left:50%:noborder --color 'fg:#bbccdd,fg+:#ddeeff,bg:#334455,preview-bg:#223344,border:#778899'\""

if not grep -q FZF_DEFAULT_OPTS "$CONFIG_FILE"
    echo "Adding FZF configuration..."
    echo "$FZF_CONFIG" >>"$CONFIG_FILE"
else
    echo "FZF configuration already exists, skipping..."
end

echo "Configurations added. Please restart your shell or run 'source $CONFIG_FILE' to apply changes."
