include theos/makefiles/common.mk

TWEAK_NAME = HookTweak
HookTweak_FILES = HookTweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
