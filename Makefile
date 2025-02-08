# This is a template makefile for a project.  The precise contents are not too important; however, your Makefile *must* have build, package,
# test and regress build targets.  Failure to have these targets will guarantee that your project fails in the CI server.

# https://makefiletutorial.com/

default:
	@-echo 'No default build target exists.  Use one of: build, test, regress, or package'
	@exit 1

# These are the required targets.  Removing these targets will break your project in the CI system.
# On failure they should exit with a non-zero exit code.

IS_WINDOWS := $(shell uname -r | grep Microsoft && echo matched)
IS_LINUX := $(shell uname | grep Linux && echo matched)
init:
ifdef IS_WINDOWS
	@-echo "WINDOWS detected. Installing necessary python packages"
	pip install pre-commit
else ifdef IS_LINUX
	apt-get -y install pre-commit ruby
else
	brew install pre-commit
# Git Leaks require
	brew install go
endif
	pre-commit install

setup:
ifeq ($(strip $(DEST)),)
	@echo "Usage: make setup DEST=../someProject [TOOLCHAIN=toolchain_name]"
	@exit 1
endif
ifeq ($(shell echo $(DEST) | cut -c1),/)
	rsync -av --exclude='.vscode/*/' --exclude='.git/' --exclude='*.template' . $(DEST)
else
	rsync -av --exclude='.vscode/*/' --exclude='.git/' --exclude='*.template' . ../$(DEST)
endif
ifdef TOOLCHAIN
	@if [ -d ".vscode/$(TOOLCHAIN)" ]; then \
		if [ "$(shell echo $(DEST) | cut -c1)" = "/" ]; then \
			mkdir -p $(DEST)/.vscode; \
			rsync -av .vscode/$(TOOLCHAIN)/ $(DEST)/.vscode/; \
		else \
			mkdir -p ../$(DEST)/.vscode; \
			rsync -av .vscode/$(TOOLCHAIN)/ ../$(DEST)/.vscode/; \
		fi \
	fi
endif
	# Overwrite destination files with templates if available
	@find . -name '*.template' | while read template; do \
		echo "Copying $$template"; \
		dest_file=$${template%.template}; \
		if [ "$(shell echo $(DEST) | cut -c1)" = "/" ]; then \
			cp $$template $(DEST)/$$dest_file; \
		else \
			cp $$template ../$(DEST)/$$dest_file; \
		fi; \
	done
