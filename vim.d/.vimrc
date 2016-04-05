set runtimepath+=~/.autoconf_console/vim.d

source ~/.autoconf_console/vim.d/vimrcs/basic.vim
source ~/.autoconf_console/vim.d/vimrcs/filetypes.vim
source ~/.autoconf_console/vim.d/vimrcs/plugins_config.vim
source ~/.autoconf_console/vim.d/vimrcs/extended.vim

try
source ~/.autoconf_console/vim.d/my_configs.vim
catch
endtry
