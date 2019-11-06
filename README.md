[![Build Status](https://travis-ci.org/universal-ctags/ctags-snap.svg?branch=master)](https://travis-ci.org/universal-ctags/ctags-snap)

Snap packaging for Universal Ctags
==================================

This repo packages universal-ctags as a [snap](https://snapcraft.io/docs).
Snaps bundle an application and its dependencies in a package that can be
installed without modification across Linux distributions.

This snap is published to the [snap store](https://snapcraft.io/store),
from which it can be discovered and installed by millions of users.

Installing
----------

To install the latest relased snap from the snapstore:

    sudo snap install universal-ctags

Or to install a build from the latest commit:

    sudo snap install --edge universal-ctags

Usage
-----

For usage instructions, see end-user docs in snap/snapcraft.yaml, or at:
https://snapcraft.io/universal-ctags

Hacking
-------

Commits to this repo are [automatically tested on Travis](https://travis-ci.org/universal-ctags/ctags-snap).

On Ubuntu 19.04 (and possibly others), you can run the same test locally using:

    make setup build install configure test

This takes a few minutes the first time.
Subsequent runs are faster.
Target 'setup' only needs to be done once.

Run `make` with no target to see documentation of the available targets.

