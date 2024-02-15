#!/bin/bash

# Define the path to the tmux.conf file and the tmux plugin manager directory
TMUX_CONF="$HOME/.tmux.conf"
TPM_DIR="$HOME/.tmux/plugins/tpm"

# Create or overwrite the tmux.conf file with the specified configuration
cat > "$TMUX_CONF" << 'EOF'
# -----------------------------------------------------------------------------
# Tmux Basic Configuration
# -----------------------------------------------------------------------------

set -g mouse              on    # Enable mouse support

setenv -g TMUX_PLUGIN_MANAGER_PATH '~/.tmux/plugins'

# -----------------------------------------------------------------------------
# Using Plugins - via tpm (tmux plugin manager)
# -----------------------------------------------------------------------------
# Recommended plugins (Please read the usage guide in each plugin's repository)
set -g @plugin 'seebi/tmux-colors-solarized'
set -g @plugin 'tmux-plugins/tmux-pain-control'
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-yank'
# Plugin that allows tmux to copy text to the system clipboard.
set -g @plugin 'tmux-plugins/tpm'

# tmux-resurrect
set -g @resurrect-dir '~/.tmux/resurrect'

# tmux-continuum: Automatically save and restore tmux sessions, usually used in conjunction with tmux-resurrect.
set -g @plugin 'tmux-plugins/tmux-continuum'

# tmux-prefix-highlight
set -g status-right '#{prefix_highlight} #H | %a %Y-%m-%d %H:%M'
set -g @prefix_highlight_show_copy_mode 'on'
set -g @prefix_highlight_copy_mode_attr 'fg=white,bg=blue'

# Initialize TPM (tmux Plugin Manager) at the end of the config file
run '~/.tmux/plugins/tpm/tpm'

EOF

# Clone the tmux Plugin Manager (tpm) if it's not already installed
if [ ! -d "$TPM_DIR" ]; then
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

# Install the plugins using tpm
bash "$TPM_DIR/bin/install_plugins"

# If tmux is running, source the tmux.conf file to apply changes
if tmux info &> /dev/null; then
    tmux source-file "$TMUX_CONF"
    echo "tmux configuration reloaded."
else
    echo "tmux is not currently running. Configuration will be applied at next tmux start."
fi

echo "tmux configuration has been created and plugins have been installed."

