semgrep_image ?= returntocorp/semgrep:1.153.1@sha256:50b839b576d76426efd3e5cffda2db0d8c403f53aa76e91d42ccf51485ac336c
semgrep_container = \
	docker run \
		--rm \
		-v "$(PWD)":/src:ro \
		-w /src \
		$(semgrep_image) \
		semgrep

# List of all rules in our project
configs = \
	--config=./yaml/ \
	--config=./typescript/

all: validate test checks

# Check rules are valid
validate:
	$(semgrep_container) \
			--validate \
			$(configs)

# Run test files
test:
	$(semgrep_container) \
			--test \
			./

# Run official recommendation checks
checks:
	$(semgrep_container) \
		--config=r/yaml.semgrep \
		--severity=ERROR \
		./
