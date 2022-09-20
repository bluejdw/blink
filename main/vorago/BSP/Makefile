MKPATH = ../../
TARGET := dummy
COMPONENTS := evk

.PHONY: $(COMPONENTS)

$(TARGET): $(COMPONENTS)

$(COMPONENTS):
	@mkdir -p bin
	@make --no-print-directory -e -C $@
	@cp $@/bin/*.o bin

CLEANDIRS := $(COMPONENTS:%=clean-%)

clean: $(CLEANDIRS)
	@find . -iname 'bin' -print | xargs rm -rf
	@find . -iname 'obj' -print | xargs rm -rf

$(CLEANDIRS):
	@make --no-print-directory -s -C $(@:clean-%=%) clean

