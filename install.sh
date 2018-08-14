# approximates the environment that nodejs-mobile gradle task uses to rebuild native modules for android
# but in a standalone, source-able script for faster feedback

mmmmm="$HOME/projects/test/node-hingy/"
host_os=linux
export TOOLCHAIN="/home/happy0/uwotm80pal"

export CC="$TOOLCHAIN"/bin/aarch64-linux-android-clang
export CXX="$TOOLCHAIN"/bin/aarch64-linux-android-clang++
# Normally LINK would be set to a linker like "ld"...
# but the nodejs-mobile Gradle scripts put a compiler there
# and indeed at least one of the gyp configs sends some
# compiler flags to the "linker", which a pure linker would
# complain about.
export LINK="$TOOLCHAIN"/bin/aarch64-linux-android-clang++
export AR="$TOOLCHAIN"/bin/aarch64-linux-android-ar

export GYP_DEFINES="target_arch=arm64 v8_target_arch=arm64 android_target_arch=arm64 host_os=$host_os OS=android"

export npm_config_arch=arm
export npm_config_platform=android
export npm_config_format=make-android
export npm_config_nodedir=/home/happy0/nodejs-mobile-android
export npm_config_node_gyp="$mmmmm"/node_modules/nodejs-mobile-gyp/bin/node-gyp.js
