cd ~/.autoconf_console


command -v terminator >/dev/null 2>&1 || { echo >&2 " --> Terminator n'est pas installé.  "; exit 1; }


DESTCONF=~/.config/terminator/config
DESTBACKUPCONF=~/.config/terminator/config.bck

# Si bashrc present, on backup
if [ -f $DESTCONF ] && [ ! -f $DESTBACKUPCONF ];then
    cp $DESTCONF $DESTBACKUPCONF
    echo " // Backup $DESTBACKUPCONF"
fi




cp terminator.d/config $DESTCONF 

echo " --> INSTALLATION DE LA CONFIGURATION DE TERMINATOR : OK"
