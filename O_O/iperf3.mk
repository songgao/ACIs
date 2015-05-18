VERSION=3.0.11

.PHONY: clean_build clean default

default: iperf3 clean_build

iperf3: iperf-$(VERSION)
	cd $<; ./configure --disable-shared --enable-static
	cd $</src; make iperf3
	cp $</src/iperf3 iperf3

iperf-$(VERSION):
	curl http://downloads.es.net/pub/iperf/iperf-$(VERSION).tar.gz | tar zx

clean_build:
	rm -rf iperf-$(VERSION)

clean: clean_build
	rm -f iperf
