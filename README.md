# Provisioning of my development machine

The machine needs:

 - to be a ubuntu/debian based system
 - a running SSH daemon
 - a running docker daemon
 - my userid with sudo-rights

Then simply call  `./run.sh`

## What will be installed

The `devtools` role will install some basic packages which i need for my
everyday work (`git`, `curl`, `make`, ...). It will also install `nodejs 4.x`
and `git-lfs` as well als `docker-compose`.

The `gotools` role will install `go` and the `go appengine SDK` in the versions
specified in `group_vars/all`.

Last but not least: the `userenv` role will patch my `.bashrc` to source a
generated file `~/.bashenv` which contains many aliases and also sets some
environment variables (like `PATH`).
