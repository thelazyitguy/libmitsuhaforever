FINALPACKAGE = 1

export TARGET = iphone:13.5:11.0
export ADDITIONAL_CFLAGS = -DTHEOS_LEAN_AND_MEAN -fobjc-arc

ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

LIBRARY_NAME = libmitsuhaforever
$(LIBRARY_NAME)_OBJC_FILES = $(wildcard *.m)
$(LIBRARY_NAME)_LIBRARIES = colorpicker
$(LIBRARY_NAME)_EXTRA_FRAMEWORKS += Cephei

include $(THEOS_MAKE_PATH)/library.mk

stage::
	mkdir -p $(THEOS_STAGING_DIR)/usr/include/MitsuhaForever
	$(ECHO_NOTHING)rsync -a ./public/* $(THEOS_STAGING_DIR)/usr/include/MitsuhaForever $(FW_RSYNC_EXCLUDES)$(ECHO_END)
	mkdir -p $(THEOS)/include/MitsuhaForever
	cp -r ./public/* $(THEOS)/include/MitsuhaForever
	cp $(THEOS_STAGING_DIR)/usr/lib/libmitsuhaforever.dylib $(THEOS)/lib/libmitsuhaforever.dylib
