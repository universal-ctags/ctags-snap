help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-7s\033[0m %s\n", $$1, $$2}'

/tmp/universal-ctags.setup:
	sudo snap install snapcraft --classic
	sudo apt-get update # for installing build dependencies packages
	sudo apt install pkg-config
	touch /tmp/universal-ctags.setup

setup: /tmp/universal-ctags.setup ## Install snap build dependencies.

/tmp/universal-ctags.build:
	snapcraft
	# TODO: parameterize version
	sudo snap install universal-ctags_0.1.1_amd64.snap --dangerous
	touch /tmp/universal-ctags.build

build: /tmp/universal-ctags.build ## Build and install the snap.

test: ## Test the installed snap.
	# Use the installed snap
	universal-ctags -R sample
	# If we didn't generate a correct tags file
	if ! grep -E '^myfunc' tags >/dev/null; then \
		echo "FAILED" >&2; \
		exit 1; \
	else \
		echo "OK" >&2; \
	fi

clean:
	sudo snap remove universal-ctags

# run 'make VERBOSE=1' to switch off SILENT
ifndef VERBOSE
.SILENT:
endif

.PHONY: clean help test

