ARCHS = arm64 armv7

THEOS_BUILD_DIR = debs
DEBUG = 1
include theos/makefiles/common.mk

TWEAK_NAME = OSExperience
OSExperience_FILES = $(wildcard missioncontrol/*.xm) $(wildcard *.xm) $(wildcard *.m) $(wildcard missioncontrol/*.m) $(wildcard missioncontrol/*.mm) $(wildcard explorer/*.c) $(wildcard launchpad/*.m) 
OSExperience_CFLAGS = -Wno-format-nonliteral -Wno-unused-function
OSExperience_FRAMEWORKS = UIKit QuartzCore CoreGraphics IOKit Security CoreText
OSExperience_PRIVATE_FRAMEWORKS = AppSupport GraphicsServices BackBoardServices SpringBoardFoundation
OSExperience_LIBRARIES = rocketbootstrap objcipc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
