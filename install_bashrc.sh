cd ~/.autoconf_console

DESTCONF=~/.bashrc 
DESTBACKUPCONF=~/.bashrc.bck 

# Si bashrc present, on backup
if [ -f $DESTCONF ] && [ ! -f $DESTBACKUPCONF ];then
    cp $DESTCONF $DESTBACKUPCONF
    echo " // Backup $DESTBACKUPCONF"
fi


cp bash.d/.bashrc $DESTCONF

echo " --> INSTALLATION DE LA CONFIGURATION DE BASH : OK"
