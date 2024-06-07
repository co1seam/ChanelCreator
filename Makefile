API_ID ?= $(shell read -p "Enter API_ID: " api_id; echo $$api_id)
API_HASH ?= $(shell read -p "Enter API_HASH: " api_hash; echo $$api_hash)
PHONE_NUMBER ?= $(shell read -p "Enter PHONE_NUMBER: " phone_number; echo $$phone_number)

IMAGE_NAME ?= chanel-creator

PROJECT_DIR ?= $(PWD)

build:
	sudo docker build -t $(IMAGE_NAME) .

run:
	sudo docker run -v $(PWD):/usr/src/app -it -e API_ID=$(API_ID) -e API_HASH=$(API_HASH) -e PHONE_NUMBER=$(PHONE_NUMBER) $(IMAGE_NAME)

run-interactive: sudo docker build
	@make run API_ID=$(API_ID) API_HASH=$(API_HASH) PHONE_NUMBER=$(PHONE_NUMBER) IMAGE_PATH=$(IMAGE_PATH)

.PHONY: build run run-interactive
