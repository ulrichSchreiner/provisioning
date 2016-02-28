#!/bin/sh

docker run -it --rm \
  -v $SSH_AUTH_SOCK:/ssh-agent \
  --env SSH_AUTH_SOCK=/ssh-agent \
  --net host \
  -v `pwd`:/work ulrichschreiner/ansible playbook \
  -u `whoami` -vv --ask-become-pass --ask-pass -i inventory playbook.yaml
