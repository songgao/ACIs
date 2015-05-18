TARGETS=olsrd iperf3 busybox

.PHONY: default all $(TARGETS)

default:
	# to make all ACIs, `make all`
	# other targets: $(TARGETS)

all: $(TARGETS)

$(TARGETS):
	cd O_O; make $@.aci $@.aci.asc
	mv O_O/$@.aci ./
	mv O_O/$@.aci.asc ./
