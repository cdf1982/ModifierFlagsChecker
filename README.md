# ModifierFlagsChecker

Sample project for Apple feedback **FB11723708** _"Ventura regression: `NSApp.currentEvent?.modifierFlags` is always 0"_ (please dupe!)

For a few years and macOS versions, up to Monterey, I’ve successfully used `NSApp.currentEvent?.modifierFlags` in an override of `mouseEntered:(NSEvent)` to detect if the Shift key was pressed.

**In the current Ventura release (13.0 22A380) this is not true anymore, as modifierFlags is always 0, no matter the key or modifier pressed**; I’ve been able to confirm this on two Ventura installations and I’ve already received Users feedback on this, so this doesn’t seem to be an occasional issue.
I’ve also confirmed today this still works fine on Monterey.

Please run this small sample project both on on Ventura and on a previous release of macOS: on prior versions: you’ll see that when the mouse pointer enters the window with the Shift key pressed, that is detected; on Ventura, it never is.

I’ve checked the documentation and nothing I’m using is marked as deprecated, but obviously I might be making a rookie mistake and I should use a different method to detect Shift key presses on Ventura; if so, I appreciate any input.
