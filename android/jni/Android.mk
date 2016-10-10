LOCAL_PATH := $(call my-dir)/../..
include $(CLEAR_VARS)

LOCAL_MODULE     := fluidsynth

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/android/jni $(LOCAL_PATH)/android/jni/include \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/src/synth \
	$(LOCAL_PATH)/src/midi \
	$(LOCAL_PATH)/src/rvoice \
	$(LOCAL_PATH)/src/sfloader \
	$(LOCAL_PATH)/src/bindings \
	$(LOCAL_PATH)/src/drivers \
	$(LOCAL_PATH)/src/utils

LOCAL_ARM_MODE   := arm
LOCAL_CFLAGS     += -DHAVE_CONFIG_H
LOCAL_SHARED_LIBRARIES := glib2_shared gthread_shared
LOCAL_STATIC_LIBRARIES := vorbis

LOCAL_SRC_FILES := \
	src/midi/fluid_midi.c \
	src/midi/fluid_midi_router.c \
	src/midi/fluid_seq.c \
	src/midi/fluid_seqbind.c \
	src/rvoice/fluid_adsr_env.c \
	src/rvoice/fluid_chorus.c \
	src/rvoice/fluid_iir_filter.c \
	src/rvoice/fluid_lfo.c \
	src/rvoice/fluid_rev.c \
	src/rvoice/fluid_rvoice.c \
	src/rvoice/fluid_rvoice_dsp.c \
	src/rvoice/fluid_rvoice_event.c \
	src/rvoice/fluid_rvoice_mixer.c \
	src/sfloader/fluid_defsfont.c \
	src/sfloader/fluid_ramsfont.c \
	src/synth/fluid_chan.c \
	src/synth/fluid_event.c \
	src/synth/fluid_gen.c \
	src/synth/fluid_mod.c \
	src/synth/fluid_synth.c \
	src/synth/fluid_tuning.c \
	src/synth/fluid_voice.c \
	src/utils/fluid_conv.c \
	src/utils/fluid_hash.c \
	src/utils/fluid_list.c \
	src/utils/fluid_ringbuffer.c \
	src/utils/fluid_settings.c \
	src/utils/fluid_sys.c \
	src/bindings/fluid_filerenderer.c \
	src/drivers/fluid_mdriver.c \
	src/drivers/fluid_adriver.c

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE     := vorbis
LOCAL_C_INCLUDES := $(LOCAL_PATH)/libvorbis-1.3.5/include $(LOCAL_PATH)/android/jni/include
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/libvorbis-1.3.5/include
LOCAL_STATIC_LIBRARIES := ogg
LOCAL_ARM_MODE   := arm
LOCAL_SRC_FILES  := \
	libvorbis-1.3.5/lib/analysis.c \
	libvorbis-1.3.5/lib/bitrate.c \
	libvorbis-1.3.5/lib/block.c \
	libvorbis-1.3.5/lib/codebook.c \
	libvorbis-1.3.5/lib/envelope.c \
	libvorbis-1.3.5/lib/floor0.c \
	libvorbis-1.3.5/lib/floor1.c \
	libvorbis-1.3.5/lib/info.c \
	libvorbis-1.3.5/lib/lookup.c \
	libvorbis-1.3.5/lib/lpc.c \
	libvorbis-1.3.5/lib/lsp.c \
	libvorbis-1.3.5/lib/mapping0.c \
	libvorbis-1.3.5/lib/mdct.c \
	libvorbis-1.3.5/lib/psy.c \
	libvorbis-1.3.5/lib/registry.c \
	libvorbis-1.3.5/lib/res0.c \
	libvorbis-1.3.5/lib/sharedbook.c \
	libvorbis-1.3.5/lib/smallft.c \
	libvorbis-1.3.5/lib/synthesis.c \
	libvorbis-1.3.5/lib/tone.c \
	libvorbis-1.3.5/lib/vorbisfile.c \
	libvorbis-1.3.5/lib/window.c
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE     := ogg
LOCAL_C_INCLUDES := $(LOCAL_PATH)/libogg-1.3.2/include $(LOCAL_PATH)/android/jni/include
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/libogg-1.3.2/include
LOCAL_ARM_MODE   := arm
LOCAL_SRC_FILES  := \
	libogg-1.3.2/src/bitwise.c \
	libogg-1.3.2/src/framing.c
include $(BUILD_STATIC_LIBRARY)

$(call import-module,glib/android)
