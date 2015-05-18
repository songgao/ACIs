VERSION=1.23.2

LDFLAGS=--static
export LDFLAGS

.PHONY: clean_build clean default

default: busybox clean_build

busybox: busybox-$(VERSION)
	cd $<; make defconfig
	cd $<; make
	cp $</busybox busybox

busybox-$(VERSION):
	curl http://busybox.net/downloads/busybox-$(VERSION).tar.bz2 | tar jx

clean_build:
	rm -rf busybox-$(VERSION)

clean: clean_build
	rm -f busybox
