Snap packaging for Universal Ctags
==================================

This repo packages universal-ctags as a [snap](https://snapcraft.io/docs).
Snaps bundle an application and its dependencies in a package that can be
installed without modification across Linux distributions.

This snap is published to the [snap store](https://snapcraft.io/store),
from which it can be discovered and installed by millions of users.

Test Procedure
==============

Build the snap
--------------

Start a shell in a 'snapcrafting' container:

    sudo apt install -y lxd lxd-client
    lxc launch ubuntu:16.04 snapcrafting
    lxc exec snapcrafting -- su - ubuntu

In the container, install snapcraft tools:

    sudo snap install snapcraft --classic
    sudo apt-get update # for installing build dependencies packages
    sudo apt-install pkg-config

Get this repo source:

    git clone https://github.com/universal-ctags/ctags-snap.git
    cd ctags-snap

Build the snap:

    snapcraft

This should create output named something like
'_universal-ctags\_0.1.1\_amd64.snap_'.

Install from the local file
---------------------------

    $ sudo snap install universal-ctags\_0.1.1_amd64.snap --dangerous

Use the installed executable
----------------------------

Use the installed executable to generate a tags file, and use that file:

    universal-ctags -R
    vim -t main

Alias executable to 'ctags'
---------------------------

End users can
[alias](https://docs.snapcraft.io/commands-and-aliases/3950)
the 'universal-ctags' executable to 'ctags':

    sudo snap alias universal-ctags ctags

