#------------------------------------------------------------------------------
# Variables
#------------------------------------------------------------------------------
scripts_dir = ./scripts

#------------------------------------------------------------------------------
# Utils
#------------------------------------------------------------------------------

utils.health:
	echo "health check"

utils.submodules.init:
	git submodule update --init --recursive

utils.submodules.update:
	git submodule update --recursive

#------------------------------------------------------------------------------
# Installation
#------------------------------------------------------------------------------
# main
install: install.pre install.pkg install.lsp install.fish install.post

# install installation dependencies and other pre-install steps
install.pre:
	sh $(scripts_dir)/pre-install.sh

# install main binaries
install.pkg:
	sh $(scripts_dir)/pkg.sh

# install lsp support
install.lsp:
	sh $(scripts_dir)/lsp.sh

# install fish shell plugins
install.fish:
	fish $(scripts_dir)/fish.fish

# do stuff now that everything is installed
install.post: utils.submodules.update
	sh $(scripts_dir)/post-install.sh
