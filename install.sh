# approximates the environment that nodejs-mobile gradle task uses to rebuild native modules for android
# but in a standalone, source-able script for faster feedback

mmmmm="$HOME/projects/test/noble-hingy/"
host_os=linux
export TOOLCHAIN="/home/happy0/projects/mmmmm-mobile/android/build/standalone-toolchains/arm-linux-androideabi"

export CC="$TOOLCHAIN"/bin/arm-linux-androideabi-clang
export CXX="$TOOLCHAIN"/bin/arm-linux-androideabi-clang++
# Normally LINK would be set to a linker like "ld"...
# but the nodejs-mobile Gradle scripts put a compiler there
# and indeed at least one of the gyp configs sends some
# compiler flags to the "linker", which a pure linker would
# complain about.
export LINK="$TOOLCHAIN"/bin/arm-linux-androideabi-clang++
export AR="$TOOLCHAIN"/bin/arm-linux-androideabi-ar

export GYP_DEFINES="target_arch=arm v8_target_arch=arm android_target_arch=arm host_os=$host_os OS=android"

export npm_config_arch=arm
export npm_config_platform=android
export npm_config_format=make-android
export npm_config_nodedir="$HOME"/projects/mmmmm-mobile/node_modules/nodejs-mobile-react-native/android/libnode/
export npm_config_node_gyp="$mmmmm"/node_modules/nodejs-mobile-gyp/bin/node-gyp.js
