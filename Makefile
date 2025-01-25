.phony: all

all: playbook ;

# the catchall rule requires my user to have my public key in my authorized_keys and
# also so enable password-less sudo for me! if this is not possible add the parameters
# --ask-become-pass --ask-pass to the invocation of the playbook

%:
	 @podman run -it --rm --init \
	  -v $(SSH_AUTH_SOCK):/ssh-agent \
	  --env SSH_AUTH_SOCK=/ssh-agent \
	  --net host \
    	  -v $(ANSIBLE_CONFIG_DIR):/etc/ansible \
	  -v `pwd`:/work docker.io/ulrichschreiner/ansible playbook \
	  -v -u `whoami` -i inventory $@.yaml
