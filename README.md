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

Automatic builds of this package, for various different architectures,
are made [on snapcraft.io](https://snapcraft.io/universal-ctags/builds),
but that link only works for owners of the universal-ctags snap.

Commits to this repo were previously
[automatically tested on Travis](https://travis-ci.org/universal-ctags/ctags-snap).
These builds were only for a single architecture, but did also invoke the repo's
end to end testing script, that verifies the executable installed by the resulting
snap is actually a functioning ctags implementation. But since travis migrated to
travis-ci.com, that is 404.

On Ubuntu 19.04 (and possibly others), you can run the same test locally using:

    make setup build install configure test

This takes a few minutes the first time. Subsequent runs are faster.
Target 'setup' only needs to be done once.

Run `make` with no target to see documentation of the available targets.

