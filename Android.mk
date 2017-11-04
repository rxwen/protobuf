# Copyright (C) 2008 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

PROTOBUF_LIB_SRC_FILES := \
	src/google/protobuf/message_lite.cc \
    src/google/protobuf/any.cc \
    src/google/protobuf/any.pb.cc \
    src/google/protobuf/api.pb.cc \
    src/google/protobuf/field_mask.pb.cc \
    src/google/protobuf/arenastring.cc \
    src/google/protobuf/type.pb.cc \
    src/google/protobuf/empty.pb.cc \
    src/google/protobuf/struct.pb.cc \
    src/google/protobuf/timestamp.pb.cc \
    src/google/protobuf/wrappers.pb.cc \
    src/google/protobuf/source_context.pb.cc \
    src/google/protobuf/arena.cc \
    src/google/protobuf/generated_message_table_driven_lite.cc \
    src/google/protobuf/duration.pb.cc \
	src/google/protobuf/map_field.cc \
	src/google/protobuf/io/zero_copy_stream_impl_lite.cc \
	src/google/protobuf/io/coded_stream.cc \
	src/google/protobuf/io/zero_copy_stream_impl.cc \
	src/google/protobuf/io/strtod.cc \
	src/google/protobuf/io/tokenizer.cc \
	src/google/protobuf/io/printer.cc \
	src/google/protobuf/io/zero_copy_stream.cc \
	src/google/protobuf/repeated_field.cc \
	src/google/protobuf/descriptor.pb.cc \
	src/google/protobuf/wire_format_lite.cc \
	src/google/protobuf/stubs/common.cc \
	src/google/protobuf/stubs/stringprintf.cc \
	src/google/protobuf/stubs/strutil.cc \
	src/google/protobuf/stubs/once.cc \
	src/google/protobuf/stubs/bytestream.cc \
	src/google/protobuf/stubs/mathlimits.cc \
	src/google/protobuf/stubs/atomicops_internals_x86_gcc.cc \
	src/google/protobuf/stubs/structurally_valid.cc \
	src/google/protobuf/stubs/substitute.cc \
	src/google/protobuf/stubs/stringpiece.cc \
	src/google/protobuf/stubs/status.cc \
	src/google/protobuf/stubs/statusor.cc \
	src/google/protobuf/stubs/int128.cc \
	src/google/protobuf/stubs/time.cc \
	src/google/protobuf/message.cc \
	src/google/protobuf/descriptor_database.cc \
	src/google/protobuf/extension_set_heavy.cc \
	src/google/protobuf/dynamic_message.cc \
	src/google/protobuf/generated_message_reflection.cc \
	src/google/protobuf/generated_message_util.cc \
	src/google/protobuf/text_format.cc \
	src/google/protobuf/extension_set.cc \
	src/google/protobuf/reflection_ops.cc \
	src/google/protobuf/descriptor.cc \
	src/google/protobuf/unknown_field_set.cc \
	src/google/protobuf/wire_format.cc \
	src/google/protobuf/util/field_mask_util.cc \
	src/google/protobuf/util/field_comparator.cc \
	src/google/protobuf/util/time_util.cc \
	src/google/protobuf/util/json_util.cc \
	src/google/protobuf/util/delimited_message_util.cc \
	src/google/protobuf/util/message_differencer.cc \
	src/google/protobuf/util/type_resolver_util.cc \
	src/google/protobuf/util/internal/json_escaping.cc \
	src/google/protobuf/util/internal/json_objectwriter.cc \
	src/google/protobuf/util/internal/json_stream_parser.cc \
	src/google/protobuf/util/internal/protostream_objectsource.cc \
	src/google/protobuf/util/internal/protostream_objectwriter.cc \
	src/google/protobuf/util/internal/datapiece.cc \
	src/google/protobuf/util/internal/default_value_objectwriter.cc \
	src/google/protobuf/util/internal/error_listener.cc \
	src/google/protobuf/util/internal/field_mask_utility.cc \
	src/google/protobuf/util/internal/object_writer.cc \
	src/google/protobuf/util/internal/proto_writer.cc \
	src/google/protobuf/util/internal/type_info.cc \
	src/google/protobuf/util/internal/utility.cc \
	src/google/protobuf/service.cc \
	src/google/protobuf/io/gzip_stream.cc

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := eng
LOCAL_C_INCLUDES := $(LOCAL_PATH)/src

LOCAL_CFLAGS += -DGOOGLE_PROTOBUF_NO_RTTI \
				-D_GLIBCXX_USE_C99_MATH \
				-DHAVE_PTHREAD
LOCAL_CPP_EXTENSION := .cc

LOCAL_SRC_FILES := $(PROTOBUF_LIB_SRC_FILES)

ifneq ($(TARGET_SIMULATOR),true)
LOCAL_C_INCLUDES += bionic		# very important!
LOCAL_C_INCLUDES += external/stlport/stlport
LOCAL_SHARED_LIBRARIES += libstlport libdl
LOCAL_CFLAGS += -DNO_TR1
else
LOCAL_LDLIBS += -lpthread
endif

LOCAL_SHARED_LIBRARIES += liblog

LOCAL_MODULE := libprotobuf
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := eng
LOCAL_C_INCLUDES := $(LOCAL_PATH)/src

LOCAL_CFLAGS += -DGOOGLE_PROTOBUF_NO_RTTI \
				-DHAVE_PTHREAD
LOCAL_CPP_EXTENSION := .cc

LOCAL_SRC_FILES := $(PROTOBUF_LIB_SRC_FILES)

LOCAL_MODULE := libprotobuf
include $(BUILD_HOST_STATIC_LIBRARY)

PROTOBUF_COMPILER_SRC_FILES := \
	src/google/protobuf/compiler/plugin.pb.cc \
	src/google/protobuf/compiler/cpp/cpp_generator.cc \
	src/google/protobuf/compiler/cpp/cpp_message_field.cc \
	src/google/protobuf/compiler/cpp/cpp_string_field.cc \
	src/google/protobuf/compiler/cpp/cpp_field.cc \
	src/google/protobuf/compiler/cpp/cpp_file.cc \
	src/google/protobuf/compiler/cpp/cpp_message.cc \
	src/google/protobuf/compiler/cpp/cpp_enum.cc \
	src/google/protobuf/compiler/cpp/cpp_primitive_field.cc \
	src/google/protobuf/compiler/cpp/cpp_enum_field.cc \
	src/google/protobuf/compiler/cpp/cpp_map_field.cc \
	src/google/protobuf/compiler/cpp/cpp_helpers.cc \
	src/google/protobuf/compiler/cpp/cpp_extension.cc \
	src/google/protobuf/compiler/cpp/cpp_service.cc \
	src/google/protobuf/compiler/code_generator.cc \
	src/google/protobuf/compiler/importer.cc \
	src/google/protobuf/compiler/command_line_interface.cc \
	src/google/protobuf/compiler/zip_writer.cc \
	src/google/protobuf/compiler/plugin.cc \
	src/google/protobuf/compiler/main.cc \
	src/google/protobuf/compiler/subprocess.cc \
	src/google/protobuf/compiler/parser.cc

include $(CLEAR_VARS)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/src

LOCAL_CFLAGS += -DGOOGLE_PROTOBUF_NO_RTTI \
				-DOPENSOURCE_PROTOBUF_CPP_BOOTSTRAP
LOCAL_CPP_EXTENSION := .cc

ifeq ($(TARGET_SIMULATOR),true)
LOCAL_LDLIBS += -lpthread
endif

LOCAL_STATIC_LIBRARIES := libprotobuf

LOCAL_SRC_FILES := $(PROTOBUF_COMPILER_SRC_FILES)

LOCAL_MODULE := aprotoc
LOCAL_MODULE_TAGS := eng
include $(BUILD_HOST_EXECUTABLE)
