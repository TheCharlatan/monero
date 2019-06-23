package=readline
$(package)_version=8.0
$(package)_download_path=https://ftp.gnu.org/gnu/readline
$(package)_file_name=$(package)-$($(package)_version).tar.gz
$(package)_sha256_hash=e339f51971478d369f8a053a330a190781acb9864cf4c541060f12078948e461
$(package)_dependencies=ncurses

define $(package)_set_vars
  $(package)_config_opts=--prefix=$(host_prefix)
  $(package)_config_opts=--exec-prefix=$(host_prefix)
  $(package)_config_opts=--host=$(HOST)
  $(package)_config_opts+=--disable-shared --with-curses
  $(package)_config_opts_release=--disable-debug-mode
  $(package)_build_opts=CFLAGS="$($(package)_cflags) $($(package)_cppflags) -fPIC"
endef
#$(package)_config_opts=--build=$(HOST)
#  $(package)_config_opts=--target=$(HOST)
#$(package)_build_opts=CC="$($(package)_cc)"
#$(package)_config_env=AR="$($(package)_ar)" RANLIB="$($(package)_ranlib)" CC="$($(package)_cc)"

define $(package)_config_cmds
  echo $(HOST) &&\
  echo $($(package)_staging_dir) &&\
  export bash_cv_have_mbstate_t=yes &&\
  export bash_cv_wcwidth_broken=yes &&\
  ./configure $($(package)_config_opts) RANLIB="$(host_prefix)/native/bin/x86_64-apple-darwin11-ranlib" AR="$(host_prefix)/native/bin/x86_64-apple-darwin11-ar" CC="$(host_prefix)/native/bin/$($(package)_cc)"
endef

define $(package)_build_cmds
  $(MAKE) $($(package)_build_opts)
endef

define $(package)_stage_cmds
  echo $($(package)_staging_dir) &&\
  echo $(host_prefix) &&\
  $(MAKE) install DESTDIR=$($(package)_staging_dir) prefix=$(host_prefix) exec-prefix=$(host_prefix)
endef

