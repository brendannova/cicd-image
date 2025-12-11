FROM node:20-slim

# Install jq and other required system utilities
RUN apt-get update && \
    apt-get install -y jq git && \
    rm -rf /var/lib/apt/lists/*

# Install Salesforce CLI using npm (global install)
RUN npm install -g @salesforce/cli

# Verify installation
RUN sf --version

# Install SFDMU plugin via sf plugin system
RUN sf plugins install sfdmu

# Install SFDX Git Delta plugin via sf plugin system
RUN echo "y" | sf plugins install sfdx-git-delta

# Verify plugin installation
RUN sf plugins