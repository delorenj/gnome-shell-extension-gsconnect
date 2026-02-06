<!--
SPDX-FileCopyrightText: GSConnect Developers https://github.com/GSConnect

SPDX-License-Identifier: GPL-2.0-or-later
-->

# Pull Request for Upstream GSConnect

## Summary

This PR fixes a bug in the keyboard shortcut availability check that was causing false negatives. The issue was in the `checkAccelerator` function in `src/preferences/keybindings.js`.

## Problem Description

The `checkAccelerator` function was using the result of the `UngrabAccelerator` call to determine if a keyboard shortcut was available, instead of checking if the `GrabAccelerator` call succeeded. This caused valid shortcuts to be incorrectly marked as unavailable.

## Solution

The fix changes the logic to:
1. Check if the grab succeeded (`action !== 0`)
2. If it succeeded, set `result = true` before ungrabbing
3. The ungrab operation is still performed to clean up, but its return value is no longer used to determine availability

## Changes Made

**File:** `src/preferences/keybindings.js`

**Function:** `checkAccelerator`

**Lines changed:** 237-240

### Before:
```javascript
// If successful, use the result of ungrabbing as our return
if (action !== 0) {
    result = await new Promise((resolve, reject) => {
```

### After:
```javascript
// If grab succeeded, the accelerator is available
if (action !== 0) {
    result = true;
    await new Promise((resolve, reject) => {
```

## Testing

The fix has been tested and verified to correctly:
1. Identify available keyboard shortcuts
2. Detect conflicts with existing shortcuts
3. Properly clean up grabbed accelerators

## Related Issue

This fix addresses issue #1215 (if applicable in upstream repository).

## Commit Message

```
Fix keyboard shortcut availability check returning false negatives

The checkAccelerator function was incorrectly using the result of
UngrabAccelerator to determine if a keyboard shortcut was available.
This caused valid shortcuts to be marked as unavailable.

The fix sets the result based on whether GrabAccelerator succeeded
(action !== 0) before performing the ungrab operation.
```

## How to Create the PR

A clean branch `upstream-pr-keyboard-shortcut-fix` has been created with just this fix applied on top of commit `3724ff6` (Use DesktopAppInfo from GioUnix, if possible).

### Steps to Submit to Upstream:

1. **Fetch the latest from upstream:**
   ```bash
   git remote add upstream https://github.com/GSConnect/gnome-shell-extension-gsconnect.git
   git fetch upstream main
   ```

2. **Check if the fix is still needed:**
   Review the upstream repository to ensure this issue hasn't already been fixed.

3. **Rebase the fix on upstream main (if needed):**
   ```bash
   git checkout upstream-pr-keyboard-shortcut-fix
   git rebase upstream/main
   ```

4. **Push to your fork:**
   ```bash
   git push origin upstream-pr-keyboard-shortcut-fix
   ```

5. **Create the PR on GitHub:**
   - Go to https://github.com/GSConnect/gnome-shell-extension-gsconnect
   - Click "New Pull Request"
   - Choose "compare across forks"
   - Set base repository: `GSConnect/gnome-shell-extension-gsconnect`, base: `main`
   - Set head repository: `delorenj/gnome-shell-extension-gsconnect`, compare: `upstream-pr-keyboard-shortcut-fix`
   - Fill in the PR title and description using the information from this document

## Additional Notes

- This is a minimal, surgical fix that only changes the necessary logic
- No new dependencies or API changes
- Maintains backward compatibility
- Follows existing code style and conventions
