Snap packaging for Universal Ctags
==================================

This repo packages universal-ctags as a [snap](https://snapcraft.io/docs).
Snaps bundle an application and its dependencies in a package that can be
installed without modification across Linux distributions.

This snap is published to the [snap store](https://snapcraft.io/store),
from which it can be discovered and installed by millions of users.

Test Procedure
--------------

    make setup build install test

This a few minutes the first time. Subsequent runs are faster.

Alias executable to 'ctags'
---------------------------

End users can
[alias](https://docs.snapcraft.io/commands-and-aliases/3950)
the 'universal-ctags' executable to 'ctags':

    sudo snap alias universal-ctags ctags

A request has been put into the snap store to provide this alias
automatically:
https://forum.snapcraft.io/t/universal-ctags-requests-alias-ctags/13305

