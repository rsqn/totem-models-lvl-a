.PHONY: build clean

MODULES=authz permissions
LATEST_TAG=$(shell git tag | head -n 1)
NEXT_VERSION=$(shell semver $(LATEST_TAG) -i patch)

build: clean test

test: test-authz test-permissions

test-authz:
	cd authz && go test

test-permissions:
	cd permissions && go test

post-build: 
	rm -rf .tmp.build.meta

clean:
	rm -rf ./bin ./vendor Gopkg.lock
	rm -rf ./authz/bin ./authz/vendor authz/Gopkg.lock
	rm -rf ./permissions/bin ./permissions/vendor permissions/Gopkg.lock

tidy:
	$(foreach var,$(MODULES), cd $(var) && go mod tidy && cd ..;)


dist: clean tidy build
	git add .
	git tag v$(NEXT_VERSION)
	git commit -m "Dist from make for $(NEXT_VERSION)"
	git push origin v$(NEXT_VERSION)
	git push


