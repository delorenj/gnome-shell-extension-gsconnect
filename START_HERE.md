<!--
SPDX-FileCopyrightText: GSConnect Developers https://github.com/GSConnect

SPDX-License-Identifier: GPL-2.0-or-later
-->

# 🚀 Upstream PR Submission - Start Here

This repository is ready to submit a bug fix to the upstream GSConnect project. All necessary documentation and tools have been prepared.

## Quick Start

**Want to submit the PR now?** Run this command:

```bash
./prepare-upstream-pr.sh
```

Then follow the on-screen instructions.

## Documentation Index

Everything you need is organized in these files:

### 📖 Essential Reading

1. **[README_UPSTREAM_PR.md](README_UPSTREAM_PR.md)** - Start here! Quick guide with step-by-step instructions
2. **[UPSTREAM_PR_CHECKLIST.md](UPSTREAM_PR_CHECKLIST.md)** - Pre-submission checklist to ensure everything is ready

### 📝 Reference Documentation

3. **[UPSTREAM_PR_SUMMARY.md](UPSTREAM_PR_SUMMARY.md)** - Complete overview of what was done and why
4. **[UPSTREAM_PR.md](UPSTREAM_PR.md)** - Technical details and full context of the bug fix
5. **[UPSTREAM_PR_DESCRIPTION.md](UPSTREAM_PR_DESCRIPTION.md)** - Copy-paste ready GitHub PR description

### 🛠️ Tools

6. **[prepare-upstream-pr.sh](prepare-upstream-pr.sh)** - Automated script to prepare the PR

## What's the Fix?

A bug in keyboard shortcut availability checking was causing false negatives. Valid shortcuts were incorrectly marked as "already in use."

**File changed:** `src/preferences/keybindings.js`  
**Lines changed:** 3 insertions, 2 deletions  
**Impact:** Users can now set keyboard shortcuts without false conflict warnings

## The Branch

A clean branch is ready for upstream:

- **Name:** `upstream-pr-keyboard-shortcut-fix`
- **Contains:** Single commit with the fix
- **Status:** ✅ Ready to submit

## Next Steps

### Option 1: Automated (Recommended)

```bash
./prepare-upstream-pr.sh
# Follow the instructions
```

### Option 2: Manual

1. Read [README_UPSTREAM_PR.md](README_UPSTREAM_PR.md)
2. Follow the manual steps
3. Use [UPSTREAM_PR_DESCRIPTION.md](UPSTREAM_PR_DESCRIPTION.md) for the PR description

### Option 3: Just Tell Me What to Do

```bash
# 1. Checkout the prepared branch
git checkout upstream-pr-keyboard-shortcut-fix

# 2. Push it to your fork
git push -u origin upstream-pr-keyboard-shortcut-fix

# 3. Go to GitHub and create a PR
# https://github.com/GSConnect/gnome-shell-extension-gsconnect
# Click "New Pull Request" → "compare across forks"
# Select your branch and submit
```

## Need Help?

- **Questions about the fix?** See [UPSTREAM_PR.md](UPSTREAM_PR.md)
- **Questions about the process?** See [README_UPSTREAM_PR.md](README_UPSTREAM_PR.md)
- **Ready to submit?** Check [UPSTREAM_PR_CHECKLIST.md](UPSTREAM_PR_CHECKLIST.md)

## GSConnect Community

- **GitHub:** https://github.com/GSConnect/gnome-shell-extension-gsconnect
- **IRC:** irc://irc.gimp.org/#gsconnect
- **Matrix:** https://matrix.to/#/#_gimpnet_#gsconnect:matrix.org

---

**Status:** ✅ Everything is ready. You can submit the PR whenever you're ready!
