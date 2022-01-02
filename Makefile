.PHONY: build clean

#deploy: export AWS_PROFILE = rsqn

build: 
	export GO111MODULE=on
	env GOOS=linux go build -ldflags="-s -w" -o bin/hello authz/main.go

test: 
	export GO111MODULE=on
	# env GOOS=linux && 
	cd authz && go test

clean:
	rm -rf ./bin ./vendor Gopkg.lock


tidy:
	cd authz && go mod tidy

#deploy: clean build
#	sls deploy --verbose

