OUTPATH = out
TARGET = mac-fan-curve.app
INSTALLPATH ?= /Applications

.PHONY: default all clean

default: $(OUTPATH)/$(TARGET)
all: default

$(OUTPATH)/$(TARGET):
	xcodebuild -arch x86_64 -scheme default -configuration Release -derivedDataPath $(OUTPATH)

clean:
	-rm -rf $(OUTPATH)

install:
	@echo "# Copying application to $(INSTALLPATH)"
	cp -r $(OUTPATH)/build/products/release/$(TARGET) $(INSTALLPATH)
	@echo ""
	@echo "# Setting the root user sticky bit on the application"
	@echo "# This action requires sudo."
	sudo chmod u+s $(INSTALLPATH)/$(TARGET)/Contents/MacOS/mac-fan-curve
	@echo ""
	@echo "# Setting root as the owner of the application"
	@echo "# This action requires sudo."
	sudo chown root $(INSTALLPATH)/$(TARGET)/Contents/MacOS/mac-fan-curve
