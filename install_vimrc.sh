cd ~/.autoconf_console


command -v vim >/dev/null 2>&1 || { echo >&2 " --> Vim n'est pas installé.  "; exit 1; }


DESTCONF=~/.vimrc
DESTBACKUPCONF=~/.vimrc.bck

# Si bashrc present, on backup
if [ -f $DESTCONF ] && [ ! -f $DESTBACKUPCONF ];then
    cp $DESTCONF $DESTBACKUPCONF
    echo " // Backup $DESTBACKUPCONF"
fi




cp vim.d/.vimrc $DESTCONF

echo " --> INSTALLATION DE LA CONFIGURATION DE VIM : OK"
