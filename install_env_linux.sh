#!/bin/bash
set -e

log() { echo "[INFO] $*"; }

command -v git &> /dev/null || { log "Installing git..."; sudo apt-get update && sudo apt-get install -y git; }
log "git: $(git --version)"

command -v gh &> /dev/null || { log "Installing gh..."; sudo apt-get update && sudo apt-get install -y gh; }
log "gh: $(gh --version)"

command -v opencode &> /dev/null || { log "Installing opencode...";
    ARCH=$(uname -m | sed 's/x86_64/x86_64/;s/aarch64/arm64/')
    VER=$(curl -s https://api.github.com/repos/opencode-ai/opencode/releases/latest | grep -oP '"tag_name": "\K[^"]+')
    curl -L "https://github.com/opencode-ai/opencode/releases/download/${VER}/opencode-${ARCH}-unknown-linux-gnu.tar.gz" | tar xz
    sudo mv opencode /usr/local/bin/
}
log "opencode: $(opencode --version 2>&1 | head -1)"

command -v vim &> /dev/null || { log "Installing vim..."; sudo apt-get update && sudo apt-get install -y vim; }
log "vim: $(vim --version | head -1)"

command -v docker-compose &> /dev/null || { log "Installing docker-compose...";
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
}
log "docker-compose: $(docker-compose --version)"

command -v docker &> /dev/null || { log "Installing docker...";
    sudo apt-get update
    sudo apt-get install -y docker.io docker-buildx-plugin
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo usermod -aG docker $USER
    sudo chmod 660 /var/run/docker.sock
}
log "docker: $(docker --version 2>&1 | head -1)"

echo "Done!"