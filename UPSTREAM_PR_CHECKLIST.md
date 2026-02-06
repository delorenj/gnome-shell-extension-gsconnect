<!--
SPDX-FileCopyrightText: GSConnect Developers https://github.com/GSConnect

SPDX-License-Identifier: GPL-2.0-or-later
-->

# Pre-Submission Checklist for Upstream PR

Before submitting the PR to upstream GSConnect, verify the following:

## Branch Validation

- [ ] Branch `upstream-pr-keyboard-shortcut-fix` exists locally
- [ ] Branch contains only the keyboard shortcut fix (1 commit)
- [ ] Branch is based on a recent commit from main/master
- [ ] No unrelated changes are included

Verify with:
```bash
git checkout upstream-pr-keyboard-shortcut-fix
git log --oneline -5
git show HEAD
```

Expected: Single commit with changes to `src/preferences/keybindings.js` only.

## Code Quality

- [x] Code follows GSConnect style guidelines
- [x] Changes are minimal and focused
- [x] No new dependencies added
- [x] Backward compatible
- [x] Comments are clear and accurate
- [x] No syntax errors

## Documentation Review

- [x] `README_UPSTREAM_PR.md` is clear and complete
- [x] `UPSTREAM_PR.md` provides adequate technical context
- [x] `UPSTREAM_PR_DESCRIPTION.md` is ready to use as PR description
- [x] `prepare-upstream-pr.sh` is executable and documented
- [x] All commit hashes are correctly referenced

## Testing (Recommended)

Before submitting, consider testing the fix:

- [ ] Build the extension with the fix: `meson _build && ninja -C _build install-zip`
- [ ] Test keyboard shortcut assignment in GSConnect preferences
- [ ] Verify available shortcuts are correctly identified
- [ ] Verify conflicts are correctly detected
- [ ] Test with various key combinations

## Upstream Readiness

- [ ] Fork is up to date with upstream
- [ ] No merge conflicts with upstream main
- [ ] Branch is pushed to your fork
- [ ] You're ready to create the PR on GitHub

## Submission Process

1. **Automated:**
   ```bash
   ./prepare-upstream-pr.sh
   ```

2. **Manual:**
   - Fetch upstream: `git fetch upstream main`
   - Checkout branch: `git checkout upstream-pr-keyboard-shortcut-fix`
   - Rebase if needed: `git rebase upstream/main`
   - Push: `git push -u origin upstream-pr-keyboard-shortcut-fix`
   - Create PR on GitHub using `UPSTREAM_PR_DESCRIPTION.md`

## After Submission

- [ ] Monitor PR for maintainer feedback
- [ ] Respond to review comments promptly
- [ ] Update PR if requested
- [ ] Be patient - maintainers are volunteers

## Notes

- GSConnect is community-driven; response time may vary
- Be respectful and professional in all interactions
- Follow the project's Code of Conduct
- Reference issue #1215 if it exists in upstream

## Contact

If you need help:
- IRC: irc://irc.gimp.org/#gsconnect
- Matrix: https://matrix.to/#/#_gimpnet_#gsconnect:matrix.org
- GitHub Discussions: https://github.com/GSConnect/gnome-shell-extension-gsconnect/discussions
