PACKER_REGION ?= eu-west-1
SOURCE_AMI ?= ami-c0cff0a6
VERSION ?= 1.0.0

.PHONY: ami
ami: ## Make the AMI
	packer build \
		-var "source_ami=$(SOURCE_AMI)" \
		-var "region=$(PACKER_REGION)" \
		-var "version=$(VERSION)" \
		template.json

.PHONY: validate
validate: ## Validate the AMI
	packer validate \
        -var "source_ami=$(SOURCE_AMI)" \
        -var "region=$(PACKER_REGION)" \
        template.json

.PHONY: help
help:
	@echo "Valid targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'
