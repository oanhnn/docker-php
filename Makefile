# Usage:
#	make		Generating Dockerfile

.PHONY: all update

all: update

update:
	rm -f versions.json
	./apply-templates.sh
