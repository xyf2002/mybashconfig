#!/bin/bash

# Define the path to the Neovim keymaps configuration file
CONFIG_FILE="$HOME/.config/nvim/lua/config/keymaps.lua"

# Check if the directory exists, and if not, create it
if [ ! -d "$(dirname "$CONFIG_FILE")" ]; then
	echo "Creating configuration directory..."
	mkdir -p "$(dirname "$CONFIG_FILE")"
fi

# Check if the configuration file exists, and if not, create it
if [ ! -f "$CONFIG_FILE" ]; then
	echo "Creating keymaps.lua file..."
	touch "$CONFIG_FILE"
fi

# Append the key mappings to the configuration file with comments
echo "Appending key mappings to $CONFIG_FILE..."
{
	echo "-- Map Alt+Right to go to the next buffer"
	echo 'vim.api.nvim_set_keymap("n", "<A-Right>", ":bnext<CR>", { noremap = true, silent = true })'
	echo "-- Map Alt+Left to go to the previous buffer"
	echo 'vim.api.nvim_set_keymap("n", "<A-Left>", ":bprevious<CR>", { noremap = true, silent = true })'
	echo "-- Map Ctrl+a to select all text"
	echo 'vim.api.nvim_set_keymap("n", "<C-a>", "ggVG", { noremap = true, silent = true })'
	echo "-- Map Ctrl+z to undo"
	echo 'vim.api.nvim_set_keymap("n", "<C-z>", "u", { noremap = true, silent = true })'

} >>"$CONFIG_FILE"

echo "Neovim key mappings have been successfully added to $CONFIG_FILE."
