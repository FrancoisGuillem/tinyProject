# tinyProject 0.7.0 (2026-01-25)

## New features
* prInit() can now initialize git thanks to new parameter "git".
* The package can now be used as a dependency in another package to create custom project templates. `prInit()` has gained several arguments to customize created folders. A new function `addProjectTemplate()` can be used to register custom templates.

## Bugfixes
* prLoad() was displaying a warning everytime it was used.

# tinyProject 0.6.1 (2019-06-11)

## Bugfixes
* The execution of .Rprofile was resulting in an error when tinyProject was not already installed.

# tinyProject 0.6 (2019-06-11)

## New features
* New function requireVariable(). In interactive mode, it asks the user to enter a value. In command line mode, it search the required variable in the command arguments.
* prLibrary() gains a new parameter 'warnings' to hide or show warnings when loading packages.
* The .Rprofile file has been improved. If tinyProject is missing it tries to install it before doing anything else.

## Bugfixes
* On Linux, when a package was missing, the function prLibrary() could start an infinite loop
