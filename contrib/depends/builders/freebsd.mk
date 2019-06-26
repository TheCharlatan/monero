build_freebsd_CC: = $(shell xcrun -f clang)
build_freebsd_CXX: = $(shell xcrun -f clang++)
build_freebsd_AR: = $(shell xcrun -f ar)
build_freebsd_RANLIB: = $(shell xcrun -f ranlib)
build_freebsd_STRIP: = $(shell xcrun -f strip)
build_freebsd_OTOOL: = $(shell xcrun -f otool)
build_freebsd_NM: = $(shell xcrun -f nm)
build_freebsd_INSTALL_NAME_TOOL:=$(shell xcrun -f install_name_tool)
build_freebsd_SHA256SUM = shasum -a 256
build_freebsd_DOWNLOAD = curl --location --fail --connect-timeout $(DOWNLOAD_CONNECT_TIMEOUT) --retry $(DOWNLOAD_RETRIES) -o

#freebsd host on freebsd builder. overrides freebsd host preferences.
freebsd_CC=$(shell xcrun -f clang) -mmacosx-version-min=$(OSX_MIN_VERSION)
freebsd_CXX:=$(shell xcrun -f clang++) -mmacosx-version-min=$(OSX_MIN_VERSION) -stdlib=libc++
freebsd_AR:=$(shell xcrun -f ar)
freebsd_RANLIB:=$(shell xcrun -f ranlib)
freebsd_STRIP:=$(shell xcrun -f strip)
freebsd_LIBTOOL:=$(shell xcrun -f libtool)
freebsd_OTOOL:=$(shell xcrun -f otool)
freebsd_NM:=$(shell xcrun -f nm)
freebsd_INSTALL_NAME_TOOL:=$(shell xcrun -f install_name_tool)
freebsd_native_toolchain=
