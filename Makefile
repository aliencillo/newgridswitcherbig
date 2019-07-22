DEBUG = 0
FINALVERSION = 1 
GO_EASY_ON_ME=1
TARGET = iphone:clang:11.2:11.2
ARCHS = arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NewGridSwitcherBig
NewGridSwitcherBig_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += prefs
include $(THEOS_MAKE_PATH)/aggregate.mk
