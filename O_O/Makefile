%.aci.asc : %.aci
	gpg --armor --detach-sign --yes $<

%.aci: %.binary
	mkdir -p $*.layout/rootfs/bin
	mv $< $*.layout/rootfs/bin/$*
	cd $*.layout/rootfs/; ../../library_magnet ./bin/$*
	./generate_manifest $* > $*.layout/manifest
	actool build --overwrite $*.layout $@
	rm -rf $*.layout

olsrd.aci: olsrd.binary
	mkdir -p olsrd.layout/rootfs/bin
	mv olsrd.binary olsrd.layout/rootfs/bin/olsrd
	cd olsrd.layout/rootfs/; ../../library_magnet ./bin/olsrd
	./generate_manifest olsrd > olsrd.layout/manifest
	mv lib/* olsrd.layout/rootfs/lib/
	actool build --overwrite olsrd.layout olsrd.aci
	rm -rf olsrd.layout
	rm -rf lib

iperf3.binary:
	make -f iperf3.mk
	mv iperf3 iperf3.binary

busybox.binary:
	make -f busybox.mk
	mv busybox busybox.binary

olsrd.binary:
	make -f olsrd.mk
	mv olsrd olsrd.binary
