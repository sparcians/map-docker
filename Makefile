REGISTRY?=map
DOCKERFILES=$(shell find * -type f -name Dockerfile)
IMAGES=$(subst /,\:,$(subst /Dockerfile,,$(DOCKERFILES)))
EXPORTED=$(addsuffix .tar.xz, $(IMAGES))
DEPENDS=.depends.mk

.PHONY: all clean $(IMAGES)

all: $(IMAGES)

clean:
	rm -f $(DEPENDS)

$(DEPENDS): $(DOCKERFILES) Makefile
	grep '^FROM $(REGISTRY)/' $(DOCKERFILES) | \
        awk -F '/Dockerfile:FROM $(REGISTRY)/' '{ print $$1 " " $$2 }' | \
        sed 's@[:/]@\\:@g' | awk '{ print $$1 ": " $$2 }' > $@

sinclude $(DEPENDS)

$(IMAGES): %:
	docker build -t $(REGISTRY)/$@ $(subst :,/,$@)

%.tar.xz: $(IMAGES)
	docker save $(REGISTRY)/$(basename $(basename $@)):latest | xz -T0 > $@

export: $(EXPORTED)
