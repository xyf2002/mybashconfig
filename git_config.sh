#!/bin/bash

# Set Git global configuration
gitUserName="xyf"
gitUserEmail="2316639449@qq.com"

# Set Git global user name
git config --global user.name "$gitUserName"
echo "Git global user name set to: $gitUserName"

# Set Git global user email
git config --global user.email "$gitUserEmail"
echo "Git global user email set to: $gitUserEmail"

echo "Git global configuration updated successfully."

