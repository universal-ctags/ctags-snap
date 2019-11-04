# Snapcraft builds on a VM by default, to avoid installing components that
# might not be compatible with the host OS.
snapcraft_flags=
ifeq ($(CI),true)
	# But on Travis, we don't need a VM, since the instance is ephemeral.
	snapcraft_flags = --destructive-mode
endif

help: ## Display help for all make targets.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-7s\033[0m %s\n", $$1, $$2}'

setup: ## Install build dependencies (ie snapcraft).
	sudo snap install --beta --classic multipass
	sudo snap install --classic snapcraft

refresh: ## Update build dependencies.
	sudo snap refresh --beta multipass
	sudo snap refresh snapcraft

build: snap/snapcraft.yaml ## Build the snap file.
	rm -f universal-ctags_*_amd64.snap
	snapcraft $(snapcraft_flags)

install: ## Install the snap from the local file.
	sudo snap install universal-ctags_*_amd64.snap --dangerous

test: ## Test the installed snap.
	./test_ctags

clean: ## Remove intermediate and snap files.
	rm -rf parts prime stage universal-ctags_*_amd64.snap
	snapcraft clean

# run 'make VERBOSE=1' to switch off SILENT
ifndef VERBOSE
.SILENT:
endif

.PHONY: help setup refresh build install test clean

