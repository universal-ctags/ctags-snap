Snap packaging for Universal Ctags
==================================

This repo packages universal-ctags as a [snap](https://snapcraft.io/docs).
Snaps bundle an application and its dependencies in a package that can be
installed without modification across Linux distributions.

This snap is published to the [snap store](https://snapcraft.io/store),
from which it can be discovered and installed by millions of users.

Test Procedure
==============

Consider doing it in a container
--------------------------------

Start a shell in a container named 'snapcrafting':

    sudo apt install -y lxd lxd-client
    lxc launch ubuntu:16.04 snapcrafting
    lxc exec snapcrafting -- su - ubuntu

Build the snap
--------------

In the container, do initial setup, once only:

    make setup

Then build the snap:

    make build

And run the test:

    make test


Alias executable to 'ctags'
---------------------------

End users can
[alias](https://docs.snapcraft.io/commands-and-aliases/3950)
the 'universal-ctags' executable to 'ctags':

    sudo snap alias universal-ctags ctags

A request has been put into the snap store to provide this alias
automatically:


