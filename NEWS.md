# tinyProject 0.6 (2019-06-11)

## New features
* New function requireVariable(). In interactive mode, it asks the user to enter a value. In command line mode, it search the required variable in the command arguments.
* prLibrary() gains a new parameter 'warnings' to hide or show warnings when loading packages.
* The .Rprofile file has been improved. If tinyProejct is missing it tries to install it before doing anything else.

## Bugfixes
* On Linux, when a package was missing, the function prLibrary() could start an infinite loop
