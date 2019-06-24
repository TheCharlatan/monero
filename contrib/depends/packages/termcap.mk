package=termcap
$(package)_version=1.3.1
$(package)_download_path=https://ftp.gnu.org/gnu/termcap
$(package)_file_name=$(package)-$($(package)_version).tar.gz
$(package)_sha256_hash=91a0e22e5387ca4467b5bcb18edf1c51b930262fd466d5fda396dd9d26719100
$(package)_patches=includedir.patch

define $(package)_set_vars
  $(package)_config_opts=--prefix=$(host_prefix)
  $(package)_config_opts+=--exec-prefix=$(host_prefix)
  $(package)_config_opts+=--host=$(HOST)
  $(package)_build_opts_darwin=RANLIB="$(host_prefix)/native/bin/x86_64-apple-darwin11-ranlib" AR="$(host_prefix)/native/bin/x86_64-apple-darwin11-ar" CC="$(host_prefix)/native/bin/$($(package)_cc)"
endef
#$(package)_config_opts=--build=$(HOST)
#  $(package)_config_opts=--target=$(HOST)
#$(package)_build_opts=CC="$($(package)_cc)"
#$(package)_config_env=AR="$($(package)_ar)" RANLIB="$($(package)_ranlib)" CC="$($(package)_cc)"

define $(package)_config_cmds
  patch -p1 < $($(package)_patch_dir)/includedir.patch &&\
  ./configure $($(package)_config_opts) 
endef

define $(package)_build_cmds
  $(MAKE) $($(package)_build_opts)
endef

define $(package)_stage_cmds
  echo $($(package)_staging_dir) &&\
  echo $(host_prefix) &&\
  $(MAKE) install
endef

