INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = brightcam

brightcam_FILES = Tweak.x
brightcam_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
