THIS REPOSITORY IS NOT MAINTAINED.
=========================================================================
The head maintainer of this repository has not respond more than one month,
and there is no secondary maintainer.

This repo introduces support the bundling/delivering universal-ctags<br/> 
through the 'snap' mechanism/store - for more details see<br/>
https://snapcraft.io.

"A snap is a bundle of your app and its dependencies that works<br/>
without modification across Linux.  Snaps are discoverable and<br/>
installable from the Snap store, an app store with an audience of<br/>
millions."[1]

In case the support/snapcraft.yaml file is accepted it can be<br/>
published in the Snap Store[2] which is required for people to easily<br/>
install it.


Test Procedure
==============

Build/Snap
----------

$ sudo apt install -y lxd lxd-clients<br/>
$ lxc launch ubuntu:16.04 snapcrafting  # create 'snapcrafting' container<br/>
$ lxc exec snapcrafting -- su - ubuntu  # execute user shell in container

$ sudo snap install snapcraft --classic # install snapcraft tool/commands<br/>
$ sudo apt-get update # update for installing build dependencies packages

$ git clone https://github.com/universal-ctags/ctags-snap.git<br/>
$ cd ctags-snap

$ # get this snapcraft.yaml file<br/>
$ snapcraft<br/>
...<br/>
Building universal-ctags<br/>
./configure --prefix=<br/>
...<br/>
make -j4<br/>
...<br/>
Snapping 'universal-ctags'<br/>
Snapped universal-ctags_0.1.1_amd64.snap

Install/Contents
----------------

$ sudo snap install universal-ctags_0.1.1_amd64.snap --dangerous --classic

$ which universal-ctags.ctags<br/>
/snap/bin/universal-ctags.ctags

$ find /snap/universal-ctags/<br/>
/snap/universal-ctags/<br/>
/snap/universal-ctags/current<br/>
/snap/universal-ctags/x1<br/>
/snap/universal-ctags/x1/bin<br/>
/snap/universal-ctags/x1/bin/ctags<br/>
/snap/universal-ctags/x1/bin/readtags<br/>
/snap/universal-ctags/x1/command-ctags.wrapper<br/>
/snap/universal-ctags/x1/command-universal-ctags.wrapper<br/>
/snap/universal-ctags/x1/meta<br/>
/snap/universal-ctags/x1/meta/gui<br/>
/snap/universal-ctags/x1/meta/snap.yaml<br/>
/snap/universal-ctags/x1/snap<br/>
/snap/universal-ctags/x1/snap/.snapcraft.yaml.swp<br/>
/snap/universal-ctags/x1/usr<br/>
/snap/universal-ctags/x1/usr/lib<br/>
/snap/universal-ctags/x1/usr/lib/x86_64-linux-gnu<br/>
/snap/universal-ctags/x1/usr/lib/x86_64-linux-gnu/libicudata.so.55<br/>
/snap/universal-ctags/x1/usr/lib/x86_64-linux-gnu/libicuuc.so.55<br/>
/snap/universal-ctags/x1/usr/lib/x86_64-linux-gnu/libxml2.so.2

Testing
-------

~/ctags$ universal-ctags -R

~/ctags$ vim -t main

The 'universal-ctags' can be aliased to 'ctags'[4].

$ sudo snap alias universal-ctags ctags<br/>
Added:<br/>
  \- universal-ctags as ctags

$ ls /snap/bin/ctags -al<br/>
lrwxrwxrwx 1 root root 15 Dec 11 02:50 /snap/bin/ctags -> universal-ctags

References:<br/>
[1] "Creating a snap" in https://docs.snapcraft.io/creating-a-snap/6799<br/>
[2] "Share with your friends" in https://docs.snapcraft.io/c-c-applications/7817<br/>
[3] "Demystifying Snap Confinement" in https://snapcraft.io/blog/demystifying-snap-confinement<br/>
[4] "Commands and aliases" in https://docs.snapcraft.io/commands-and-aliases/3950
