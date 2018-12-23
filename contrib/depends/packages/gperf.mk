package=gperf
$(package)_version=3.1
$(package)_download_path=ftp.gnu.org/pub/gnu/gperf/
$(package)_file_name=gperf-3.1.tar.gz
$(package)_sha256_hash=588546b945bba4b70b6a3a616e80b4ab466e3f33024a352fc2198112cdbb3ae2

define $(package)_set_vars
  $(package)_config_opts=--disable-shared --enable-static
  $(package)_config_opts_linux=--with-pic
endef

define $(package)_config_cmds
  $($(package)_autoconf)
endef

define $(package)_build_cmds
  $(MAKE)
endef

define $(package)_stage_cmds
  $(MAKE) DESTDIR=$($(package)_staging_dir) install
endef
