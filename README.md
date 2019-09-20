[![Build Status](https://travis-ci.org/universal-ctags/ctags-snap.svg?branch=master)](https://travis-ci.org/universal-ctags/ctags-snap)

Snap packaging for Universal Ctags
==================================

This repo packages universal-ctags as a [snap](https://snapcraft.io/docs).
Snaps bundle an application and its dependencies in a package that can be
installed without modification across Linux distributions.

This snap is published to the [snap store](https://snapcraft.io/store),
from which it can be discovered and installed by millions of users.

Test Procedure
--------------

Commits to this repo are [automatically tested on Travis](https://travis-ci.org/universal-ctags/ctags-snap).
You can run the same test locally using:

    make setup build install test

This takes a few minutes the first time. Subsequent runs are faster.

Run `make` with no target to see documentation of the available targets.

Alias executable to 'ctags'
---------------------------

End users can
[alias](https://docs.snapcraft.io/commands-and-aliases/3950)
the 'universal-ctags' executable to 'ctags':

    sudo snap alias universal-ctags ctags

A request has been put into the snap store to provide this alias
automatically:
https://forum.snapcraft.io/t/universal-ctags-requests-alias-ctags/13305

