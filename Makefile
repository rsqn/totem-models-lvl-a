.PHONY: build clean

#deploy: export AWS_PROFILE = rsqn

build: clean test

test: 
	export GO111MODULE=on
	# env GOOS=linux && 
	cd authz && go test

clean:
	rm -rf ./bin ./vendor Gopkg.lock

tidy:
	cd authz && go mod tidy

dist: clean tidy build
	echo "Just commit I fink"

#deploy: clean build
#	sls deploy --verbose

