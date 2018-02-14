TOP=$(shell git rev-parse --show-toplevel)
REPO=`basename ${TOP}`
.PHONY: web-traffic-generator

all: web-traffic-generator

web-traffic-generator:
	commit=`git log -1 | grep commit | cut -d ' ' -f 2` && \
	docker build --label REPO="${REPO}" --label COMMIT_ID="$$commit" -t web-traffic-generator -f Dockerfile .

