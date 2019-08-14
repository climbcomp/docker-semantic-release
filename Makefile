image-name := climbcomp/semantic-release
image-tag := 15.13.21
image := $(image-name):$(image-tag)

.PHONY: bash
bash: build
	docker run -it --entrypoint '/bin/sh' --rm $(image)

.PHONY: build
build:
	docker build -t $(image) .

.PHONY: test
test: build
	docker run --rm $(image)

.PHONY: push
push: build
	docker push $(image)
