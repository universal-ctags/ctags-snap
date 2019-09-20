version=$(shell grep '^version:' snap/snapcraft.yaml | cut -d"'" -f2)

# snapcraft builds on a VM by default, to avoid corrupting the instance with
# installed components that might not be compatible with the instance OS.
# But if building on Travis, we don't need that, since the host is ephemeral.
snapcraft_flags=
ifeq ($(CI),1)
	# Building on Travis
	snapcraft_flags=--destructive-mode
endif

help: ## Display help for all make targets.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-7s\033[0m %s\n", $$1, $$2}'

setup: ## Install build dependencies (ie snapcraft).
	sudo snap install --beta --classic multipass
	sudo snap install --classic snapcraft

refresh: ## Update build dependencies.
	sudo snap refresh --beta multipass
	sudo snap refresh snapcraft

universal-ctags_$(version)_amd64.snap: snap/snapcraft.yaml
	snapcraft $(snapcraft_flags)

build: universal-ctags_$(version)_amd64.snap ## Build the snap file.

install: ## Install the snap from the local file.
	pwd
	ls -l
	sudo snap install universal-ctags_$(version)_amd64.snap --dangerous

test: ## Test the installed snap.
	universal-ctags -R sample
	# If the generated tags file looks valid
	if grep -E '^myfunc' tags >/dev/null; then \
		echo "OK" >&2; \
	else \
		echo "FAILED" >&2; \
		exit 1; \
	fi

clean: ## Uninstall snap, remove built snap files.
	rm -rf parts prime stage universal-ctags_*_amd64.snap

# run 'make VERBOSE=1' to switch off SILENT
ifndef VERBOSE
.SILENT:
endif

.PHONY: help setup refresh build install test clean

