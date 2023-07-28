Snap packaging for Universal Ctags
==================================

This repo packages [universal-ctags](https://ctags.io/) as a [snap](https://snapcraft.io/docs).
Snaps bundle an application and its dependencies in a package that can be
installed without modification across Linux distributions.

For installation and usage instructions, see this snap's entry in the
[snap store](https://snapcraft.io/universal-ctags),
which are derived from the docs in `snap/snapcraft.yaml`.

Hacking
-------

Automatic builds of this package, for various different architectures,
are made [on snapcraft.io](https://snapcraft.io/universal-ctags/builds),
but that link only works for owners of the universal-ctags snap.

On Ubuntu 19.04 and later, you can run the same build locally, plus a quick
e2e test script, using:

    make setup build install configure test

This takes a few minutes the first time. Subsequent runs are faster.
Target 'setup' only needs to be done once.

Run `make` with no target to see documentation of the available targets.

