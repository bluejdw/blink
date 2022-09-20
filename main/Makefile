include defs.mk

MAKE=make
TARGET := image.elf
TARGETDIR := bin
MAPFILE := $(basename $(TARGET))

.PHONY: app startup vorago

ifeq ($(LINKSPEC),)
   LINKSPEC := startup/vorago_va416x0.ld
endif


QUIETMAKE=$(MAKE) --no-print-directory

$(TARGET): components
	@echo "	LINK	" $@
	@mkdir -p $(TARGETDIR)
	@$(CC) $(LDFLAGS) \
		-Wl,-Map="$(MAPFILE).map" \
		-T $(LINKSPEC) \
		-lm $(TARGETDIR)/*.o  -lc \
		-o $(TARGETDIR)/$(TARGET)

components: app startup vorago

app:
	@$(QUIETMAKE) -C $@
	@mkdir -p $(TARGETDIR)
	@cp $@/$(TARGETDIR)/*.o $(TARGETDIR)

startup:
	@$(QUIETMAKE) -C $@
	@mkdir -p $(TARGETDIR)
	@cp $@/$(TARGETDIR)/*.o $(TARGETDIR)

vorago:
	@$(QUIETMAKE) -C $@
	@mkdir -p $(TARGETDIR)
	@cp $@/$(TARGETDIR)/*.o $(TARGETDIR)


clean:
	@$(QUIETMAKE) -C app clean
	@$(QUIETMAKE) -C vorago clean
	@$(QUIETMAKE) -C startup clean
	@find . -iname '*.log' -print | xargs rm -f
	@find . -iname 'bin' -print | xargs rm -rf
	@rm -f server.out
	@rm -f $(MAPFILE).map 
