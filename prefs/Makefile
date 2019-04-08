DEBUG = 0
GO_EASY_ON_ME=1
TARGET = iphone:clang:11.2:11.2
ARCHS = arm64

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = NewGridSwitcherBigPrefs
NewGridSwitcherBigPrefs_FILES = NGRootListController.m
NewGridSwitcherBigPrefs_INSTALL_PATH = /Library/PreferenceBundles
NewGridSwitcherBigPrefs_FRAMEWORKS = UIKit
NewGridSwitcherBigPrefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/NewGridSwitcherBigPrefs.plist$(ECHO_END)
