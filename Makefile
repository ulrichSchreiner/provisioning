# the rule requires my user to have my public key in my authorized_keys and
# also so enable password-less sudo for me! if this is not possible add the parameters
# --ask-become-pass --ask-pass to the invocation of the playbook

.phony:
all:
	@[ "${ANSIBLE_CONFIG_DIR}" ] && echo "config dir found" || ( echo "ANSIBLE_CONFIG_DIR is not set"; exit 1 )
	ansible-playbook playbook.yaml -i inventory

.phony:
install:
	ansible-galaxy install -r requirements.yml