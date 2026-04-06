#!/usr/bin/env bash
set -euo pipefail

if command -v slack &>/dev/null && ! snap list slack &>/dev/null 2>&1; then
    echo "Slack is already installed (non-snap)."
    exit 0
fi

# Remove snap version if present
if snap list slack &>/dev/null 2>&1; then
    echo "Removing snap version of Slack..."
    sudo snap remove slack
fi

echo "Installing Slack from official apt repo..."
wget -qO- https://packagecloud.io/slacktechnologies/slack/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/slack-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/slack-archive-keyring.gpg] https://packagecloud.io/slacktechnologies/slack/debian/ jessie main" | sudo tee /etc/apt/sources.list.d/slack.list > /dev/null
sudo apt-get update
sudo apt-get install -y slack-desktop
echo "Done. Slack installed via apt."
