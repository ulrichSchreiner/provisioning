# Provisioning of my development machine

The machine needs:

 - to be a ubuntu/debian/fedora/arch based system
 - a running SSH daemon
 - a running docker daemon
 - my userid with sudo-rights

Then simply call  `./run.sh`

## What will be installed

With the `worktools` role i will install some external repositories (docker,
dropbox, chrome, ...) and install the basic tools i use for my daily work. The
list of tools is in `group_vars/all`.

The `devtools` role installs some tools where there is no ubuntu package
available. They are cloned from github in the specified version.

The `gotools` role will install `go` and the `go appengine SDK` in the versions
specified in `group_vars/all`.

Last but not least: the `userenv` role will patch my `.bashrc` to source a
generated file `~/.bashenv` which contains many aliases and also sets some
environment variables (like `PATH`).

Note that the `NODE_PATH` will be changed to your home directories `~/npm`, so
that installations of node packages will not be installed globally.
