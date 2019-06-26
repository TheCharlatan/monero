FREEBSD_SDK=$(SDK_PATH)/freebsd
LD64_VERSION=253.9
freebsd_CC=clang -target $(host) --sysroot $(OSX_SDK) -mlinker-version=$(LD64_VERSION) -B $(host_prefix)/native/bin
freebsd_CXX=clang++ -target $(host) --sysroot $(OSX_SDK) -mlinker-version=$(LD64_VERSION) -stdlib=libc++ -B $(host_prefix)/native/bi

frebsd_CFLAGS=-pipe
freebsd_CXXFLAGS=$(freebsd_CFLAGS)

freebsd_release_CFLAGS=-O1
freebsd_release_CXXFLAGS=$(freebsd_release_CFLAGS)

freebsd_debug_CFLAGS=-O1
freebsd_debug_CXXFLAGS=$(freebsd_debug_CFLAGS)

