DOTFILES := $(shell pwd)

all: crossplatform

crossplatform:
    sh $(DOTFILES)/setup/generic.sh

platform:
    sh $(DOTFILES)/setup/platform.sh

mac: platform crossplatform
linux: platform crossplatform
