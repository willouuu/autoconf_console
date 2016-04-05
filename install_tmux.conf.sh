cd ~/.autoconf_console


command -v tmux >/dev/null 2>&1 || { echo >&2 " --> Tmux n'est pas installé.  "; exit 1; }


DESTCONF=~/.tmux.conf
DESTBACKUPCONF=~/.tmux.conf.bck

# Si bashrc present, on backup
if [ -f $DESTCONF ] && [ ! -f $DESTBACKUPCONF ];then
    cp $DESTCONF $DESTBACKUPCONF
    echo " // Backup $DESTBACKUPCONF"
fi




cp tmux.d/.tmux.conf $DESTCONF


echo " --> INSTALLATION DE LA CONFIGURATION DE TMUX : OK"
