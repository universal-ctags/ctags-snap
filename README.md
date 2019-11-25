[![Build Status](https://travis-ci.org/universal-ctags/ctags-snap.svg?branch=master)](https://travis-ci.org/universal-ctags/ctags-snap)

Snap packaging for Universal Ctags
==================================

This repo packages universal-ctags as a [snap](https://snapcraft.io/docs).
Snaps bundle an application and its dependencies in a package that can be
installed without modification across Linux distributions.

For installation and usage instructions, see this snap's entry in the
[snap store](https://snapcraft.io/universal-ctags),
which are derived from the docs in `snap/snapcraft.yaml`.

Hacking
-------

To install the snap from the local file produced by this repo:

    sudo snap install universal-ctags*.snap --dangerous

Commits to this repo are [automatically tested on Travis](https://travis-ci.org/universal-ctags/ctags-snap).

On Ubuntu 19.04 (and possibly others), you can run the same test locally using:

    make setup build install configure test

This takes a few minutes the first time.
Subsequent runs are faster.
Target 'setup' only needs to be done once.

Run `make` with no target to see documentation of the available targets.

