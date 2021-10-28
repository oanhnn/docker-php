# Usage:
#	make		Generating Dockerfile

.PHONY: all generate

all: generate

generate:
	rm -f versions.json
	./apply-templates.sh
