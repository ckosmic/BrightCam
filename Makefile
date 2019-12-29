INSTALL_TARGET_PROCESSES = Camera

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = brightcam

brightcam_FILES = Tweak.x
brightcam_CFLAGS = -fobjc-arc
brightcam_PRIVATE_FRAMEWORKS = CameraUI

include $(THEOS_MAKE_PATH)/tweak.mk
