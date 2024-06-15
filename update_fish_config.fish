#!/usr/bin/env fish

# Backup the existing config.fish file if it exists
if test -f ~/.config/fish/config.fish
    echo "Backing up existing config.fish to config.fish.bak"
    cp ~/.config/fish/config.fish ~/.config/fish/config.fish.bak
end

# Download the remote config.fish file
echo "Downloading config.fish from remote repository"
curl -o ~/.config/fish/config.fish https://raw.githubusercontent.com/xyf2002/dotfiles/main/fish/config.fish

# Check if the download was successful
if test $status -eq 0
    echo "Download successful. New config.fish has been saved to ~/.config/fish/config.fish"
else
    echo "Download failed. Restoring backup."
    # Restore the backup if the download failed
    if test -f ~/.config/fish/config.fish.bak
        mv ~/.config/fish/config.fish.bak ~/.config/fish/config.fish
    end
    exit 1
end

# Reload the fish configuration
echo "Reloading fish configuration"
source ~/.config/fish/config.fish

echo "Done."
