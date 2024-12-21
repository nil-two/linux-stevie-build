BUILD_IMAGE_NAME = linux-stevie-build
BUILD_IMAGE_TAG  = 1.0

all:

build-build-image:
	docker build -t $(BUILD_IMAGE_NAME):$(BUILD_IMAGE_TAG) .

debug-build-image:
	docker run --rm --network=none -u "$$(id -u):$$(id -g)" -w /src -v "$$(pwd)/src:/src" -it $(BUILD_IMAGE_NAME):$(BUILD_IMAGE_TAG) bash

download-source:
	test -f src/stevie.orig.1of2 || wget -O src/stevie.orig.1of2 https://timthompson.com/tjt/stevie/stevie.orig.1of2
	test -f src/stevie.orig.2of2 || wget -O src/stevie.orig.2of2 https://timthompson.com/tjt/stevie/stevie.orig.2of2

extract-source:
	test -f src/stevie.orig.1of2
	test -f src/stevie.orig.2of2
	(cd src && sh stevie.orig.1of2)
	(cd src && sh stevie.orig.2of2)

patch-source:
	patch src/stevie.h patch/stevie.h.patch
	patch src/hexchars.c patch/hexchars.c.patch

clean-source:
	rm -f src/Makefile src/README src/*.c src/*.h

build:
	docker run --rm --network=none -u "$$(id -u):$$(id -g)" -w /src -v "$$(pwd)/src:/src" $(BUILD_IMAGE_NAME):$(BUILD_IMAGE_TAG) make

clean:
	rm -f src/*.o src/stevie src/s4vi
