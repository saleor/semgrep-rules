opengrep_image ?= localhost/opengrep
opengrep_container = \
	docker run \
		--rm \
		--pull=never \
		-v "$(PWD)":/src:ro \
		-w /src \
		$(opengrep_image) \
		opengrep

# List of all rules in our project
configs = \
	--config=./yaml/ \
	--config=./typescript/

all: validate test checks

# Check rules are valid
validate:
	$(opengrep_container) \
		--validate \
		$(configs)

# Run test files
test:
	$(opengrep_container) \
		--test \
		./

# Run official recommendation checks
checks:
	$(opengrep_container) \
		--config=r/yaml.semgrep \
		--severity=ERROR \
		./

build:
	docker build -t $(opengrep_image) .
