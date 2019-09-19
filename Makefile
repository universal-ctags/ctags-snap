version=$(shell grep '^version:' snap/snapcraft.yaml | cut -d"'" -f2)

help: ## Display this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-7s\033[0m %s\n", $$1, $$2}'

universal-ctags_$(version)_amd64.snap: snap/snapcraft.yaml
	snapcraft

build: universal-ctags_$(version)_amd64.snap ## Build the snap file.

install: ## Install the snap from the local file.
	sudo snap install universal-ctags_$(version)_amd64.snap --dangerous

test: ## Test the installed snap.
	universal-ctags -R sample
	# If we didn't generate a correct tags file
	if ! grep -E '^myfunc' tags >/dev/null; then \
		echo "FAILED" >&2; \
		exit 1; \
	else \
		echo "OK" >&2; \
	fi

clean: ## Uninstall snap, remove built snap files
	sudo snap remove universal-ctags
	rm -rf universal-ctags_*_amd64.snap

# run 'make VERBOSE=1' to switch off SILENT
ifndef VERBOSE
.SILENT:
endif

.PHONY: clean help test

