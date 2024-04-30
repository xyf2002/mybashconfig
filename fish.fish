#!/usr/bin/env fish

set -l CONFIG_FILE "$HOME/.config/fish/config.fish"

function ensure_content
    set -l content "$argv[1]"
    if not grep -q "$content" "$CONFIG_FILE"
        echo "Adding content: $content"
        echo "$content" >>"$CONFIG_FILE"
    else
        echo "Content already exists: $content"
    end
end

# Add all aliases and configurations
ensure_content "alias nv='nvim'"
ensure_content "alias LS='ls'"
ensure_content "alias r='ranger'"
ensure_content "alias R='ranger'"
ensure_content "alias CD='cd'"
ensure_content "alias vpnuoe='sudo openfortivpn remote.net.ed.ac.uk:8443 -u s2223191'"

# Git-related aliases
ensure_content "alias gaa='git add --all'"
ensure_content "alias gcm='git commit -m'"
ensure_content "alias ga='git add'"
ensure_content "alias gst='git status'"
ensure_content "alias gp='git push'"

# Add extract function and alias
if not grep -q "function extract" "$CONFIG_FILE"
    echo "function extract" >>"$CONFIG_FILE"
    cat >>"$CONFIG_FILE" << EOF
    extract () {
        if test -z "$argv[1]"; then
            echo "Usage: extract <path/file>"
            return 1
        end
        switch "$argv[1]"
            case '*.tar.bz2' tar xjf "$argv[1]"
            case '*.tar.gz' tar xzf "$argv[1]"
            case '*.bz2' bunzip2 "$argv[1]"
            case '*.rar' unrar x "$argv[1]"
            case '*.gz' gunzip "$argv[1]"
            case '*.tar' tar xf "$argv[1]"
            case '*.tbz2' tar xjf "$argv[1]"
            case '*.tgz' tar xzf "$argv[1]"
            case '*.zip' unzip "$argv[1]"
            case '*.Z' uncompress "$argv[1]"
            case '*.7z' 7z x "$argv[1]"
            default echo "Don't know how to extract $argv[1]"
        end
    }
    EOF
    echo "alias x='extract'" >>"$CONFIG_FILE"
end

# FZF configuration
set -l FZF_CONFIG "set -x FZF_DEFAULT_OPTS \"--height 100% --layout=reverse --info inline --border --preview 'cat {}' --preview-window left:50%:noborder --color 'fg:#bbccdd,fg+:#ddeeff,bg:#334455,preview-bg:#223344,border:#778899'\""

ensure_content "$FZF_CONFIG"

echo "Configurations added. Please restart your shell or run 'source $CONFIG_FILE' to apply changes."
