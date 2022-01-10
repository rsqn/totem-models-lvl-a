.PHONY: build clean

MODULES=authz permissions

build: clean test

test: test-authz test-permissions

test-authz:
	cd authz && go test

test-permissions:
	cd permissions && go test

clean:
	rm -rf ./bin ./vendor Gopkg.lock
	rm -rf ./authz/bin ./authz/vendor authz/Gopkg.lock
	rm -rf ./permissions/bin ./permissions/vendor permissions/Gopkg.lock

tidy:
	$(foreach var,$(MODULES), cd $(var) && go mod tidy && cd ..;)

increase-version: 
	echo semver 
	echo then tag

dist: clean increase-version tidy build
	echo "Just commit I fink"
	git add .
	git commit -m "Deploy from make"
	git push

