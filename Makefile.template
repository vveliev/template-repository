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
