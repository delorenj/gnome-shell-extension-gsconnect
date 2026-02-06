#!/bin/bash
# SPDX-FileCopyrightText: GSConnect Developers https://github.com/GSConnect
# SPDX-License-Identifier: GPL-2.0-or-later

# Script to prepare a PR for upstream GSConnect repository
# This script automates the process described in UPSTREAM_PR.md

set -e

echo "=== Preparing Upstream PR for GSConnect ==="
echo ""

# Check if we're in the right directory
if [ ! -f "src/preferences/keybindings.js" ]; then
    echo "Error: This script must be run from the repository root"
    exit 1
fi

# Add upstream remote if it doesn't exist
if ! git remote | grep -q "^upstream$"; then
    echo "Adding upstream remote..."
    git remote add upstream https://github.com/GSConnect/gnome-shell-extension-gsconnect.git
else
    echo "Upstream remote already exists"
fi

# Fetch upstream
echo "Fetching upstream main branch..."
git fetch upstream main

# Check if branch exists
if git rev-parse --verify upstream-pr-keyboard-shortcut-fix >/dev/null 2>&1; then
    echo "Branch upstream-pr-keyboard-shortcut-fix already exists"
    git checkout upstream-pr-keyboard-shortcut-fix
else
    echo "Creating branch upstream-pr-keyboard-shortcut-fix"
    git checkout -b upstream-pr-keyboard-shortcut-fix upstream/main
fi

# Check if the fix is already applied
if git log --oneline --grep="keyboard shortcut availability check" -1 | grep -q "keyboard"; then
    echo "Fix appears to already be in the branch"
else
    echo "Applying fix..."
    # Cherry-pick the fix commit
    git cherry-pick 97752cbd9b98e2fb076331dc3422aea58feaf90c || {
        echo "Cherry-pick failed. You may need to resolve conflicts manually."
        exit 1
    }
fi

echo ""
echo "=== Branch prepared successfully ==="
echo ""
echo "Next steps:"
echo "1. Review the changes: git show HEAD"
echo "2. Push to your fork: git push -u origin upstream-pr-keyboard-shortcut-fix"
echo "3. Go to https://github.com/GSConnect/gnome-shell-extension-gsconnect"
echo "4. Click 'New Pull Request' and select your branch"
echo "5. Use the information from UPSTREAM_PR.md for the PR description"
echo ""
