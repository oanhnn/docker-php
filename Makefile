.PHONY: help
help:
	@echo "Usage:"
	@echo " make update    Update new version from official images"
	@echo " make clean     Clean up workspace"
	@echo " make help      Show this help output"

.PHONY: update
update: clean
	./apply-templates.sh

.PHONY: clean
clean:
	rm -f versions.json
