# Copyright (C) 2009 The Android Open Source Project
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
#

$(call assert-defined,_platform GDK_PLATFORMS_ROOT)

# For each platform, determine the corresponding supported ABIs
# And record them in GDK_PLATFORM_$(platform)_ABIS
#
_abis := $(strip $(notdir $(wildcard $(GDK_PLATFORMS_ROOT)/$(_platform)/arch-*)))
_abis := $(_abis:arch-%=%)

$(call gdk_log,PLATFORM $(_platform) supports: $(_abis))

GDK_PLATFORM_$(_platform)_ABIS    := $(_abis)

# Record the sysroots for each supported ABI
#
$(foreach _abi,$(_abis),\
  $(eval GDK_PLATFORM_$(_platform)_$(_abi)_SYSROOT := $(GDK_PLATFORMS_ROOT)/$(_platform)/arch-$(_abi))\
  $(call gdk_log,  ABI $(_abi) sysroot is: $(GDK_PLATFORM_$(_platform)_$(_abi)_SYSROOT))\
)
