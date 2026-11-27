LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libshim_camera
LOCAL_SRC_FILES := camera_shim.cpp
LOCAL_SHARED_LIBRARIES := libgui
LOCAL_MULTILIB := 32
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
