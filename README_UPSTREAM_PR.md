<!--
SPDX-FileCopyrightText: GSConnect Developers https://github.com/GSConnect

SPDX-License-Identifier: GPL-2.0-or-later
-->

# Contributing the Keyboard Shortcut Fix to Upstream GSConnect

This repository contains a bug fix for GSConnect that needs to be contributed back to the upstream repository at [GSConnect/gnome-shell-extension-gsconnect](https://github.com/GSConnect/gnome-shell-extension-gsconnect).

## Quick Start

The easiest way to submit the PR is to use the provided script:

```bash
./prepare-upstream-pr.sh
```

Then follow the instructions printed by the script.

## Manual Process

If you prefer to do it manually, follow these steps:

### 1. Prepare Your Environment

```bash
# Add the upstream remote
git remote add upstream https://github.com/GSConnect/gnome-shell-extension-gsconnect.git

# Fetch the latest from upstream
git fetch upstream main
```

### 2. Use the Prepared Branch

A clean branch `upstream-pr-keyboard-shortcut-fix` has been created with just the fix:

```bash
# Check out the branch
git checkout upstream-pr-keyboard-shortcut-fix

# Verify the fix is there
git log --oneline -1
git show HEAD
```

### 3. Rebase on Upstream (if needed)

If upstream has moved forward, rebase:

```bash
git rebase upstream/main
```

### 4. Push to Your Fork

```bash
git push -u origin upstream-pr-keyboard-shortcut-fix
```

### 5. Create the PR on GitHub

1. Go to https://github.com/GSConnect/gnome-shell-extension-gsconnect
2. Click "New Pull Request"
3. Click "compare across forks"
4. Set:
   - **Base repository:** `GSConnect/gnome-shell-extension-gsconnect`
   - **Base branch:** `main`
   - **Head repository:** `delorenj/gnome-shell-extension-gsconnect`
   - **Compare branch:** `upstream-pr-keyboard-shortcut-fix`
5. Click "Create Pull Request"
6. Use the content from `UPSTREAM_PR_DESCRIPTION.md` as the PR description

## What's the Fix?

The fix corrects a bug in keyboard shortcut availability checking:

**Before:** The code was using the result of ungrabbing an accelerator to determine if it was available (always returned false)

**After:** The code correctly checks if grabbing succeeded, then properly ungrabs to clean up

**Impact:** Users can now set keyboard shortcuts without false "already in use" errors

## Files Modified

- `src/preferences/keybindings.js` - Lines 237-240 (3 insertions, 2 deletions)

## Documentation

- `UPSTREAM_PR.md` - Technical details and background
- `UPSTREAM_PR_DESCRIPTION.md` - Template for the GitHub PR description
- `prepare-upstream-pr.sh` - Automated preparation script

## Questions?

Refer to the GSConnect contributing guidelines:
- [CONTRIBUTING.md](./CONTRIBUTING.md)
- [GSConnect Wiki](https://github.com/GSConnect/gnome-shell-extension-gsconnect/wiki/)
