VERSION=0.6.8

.PHONY: clean_build clean default

default: olsrd clean_build

olsrd: olsrd-$(VERSION)
	cd $<; make build_all
	cp $</olsrd olsrd
	mkdir -p lib
	cp $</lib/*/*.so.* lib/

olsrd-$(VERSION):
	curl http://www.olsr.org/releases/0.6/olsrd-$(VERSION).tar.gz | tar zx

clean_build:
	rm -rf olsrd-$(VERSION)

clean: clean_build
	rm -f olsrd
