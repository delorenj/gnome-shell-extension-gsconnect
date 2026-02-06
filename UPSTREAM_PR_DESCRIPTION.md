## Fix keyboard shortcut availability check returning false negatives

### Description

This PR fixes a bug in the keyboard shortcut availability check that was causing false negatives when users tried to set keyboard shortcuts in GSConnect preferences.

### Problem

The `checkAccelerator` function in `src/preferences/keybindings.js` was incorrectly determining whether a keyboard shortcut was available. It was using the return value from the `UngrabAccelerator` D-Bus call to determine availability, when it should have been checking whether the initial `GrabAccelerator` call succeeded.

This caused valid, available keyboard shortcuts to be incorrectly marked as "already in use" when they were actually free to use.

### Solution

The fix is simple and surgical:
- Check if `GrabAccelerator` succeeded (`action !== 0`)
- If it succeeded, set `result = true` 
- Still call `UngrabAccelerator` to properly clean up, but don't use its return value to determine availability

### Changes

**File:** `src/preferences/keybindings.js`
**Lines:** 237-240

```diff
-        // If successful, use the result of ungrabbing as our return
+        // If grab succeeded, the accelerator is available
         if (action !== 0) {
-            result = await new Promise((resolve, reject) => {
+            result = true;
+            await new Promise((resolve, reject) => {
```

### Testing

This fix has been tested and verified to:
- ✅ Correctly identify available keyboard shortcuts
- ✅ Properly detect conflicts with shortcuts that are actually in use
- ✅ Clean up grabbed accelerators properly

### Checklist

- [x] Code follows project style guidelines
- [x] Changes are minimal and focused on the bug fix
- [x] No new dependencies added
- [x] Backward compatible
- [x] Tested manually

### Related Issues

This addresses keyboard shortcut false positive issues where valid shortcuts were incorrectly marked as unavailable.
