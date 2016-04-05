cd ~/.autoconf_console


command -v git >/dev/null 2>&1 || { echo >&2 " --> Git n'est pas installé.  "; exit 1; }


DESTCONF=~/.gitconfig
DESTBACKUPCONF=~/.gitconfig.bck

# Si bashrc present, on backup
if [ -f $DESTCONF ] && [ ! -f $DESTBACKUPCONF ];then
    cp $DESTCONF $DESTBACKUPCONF
    echo " // Backup $DESTBACKUPCONF"
fi

echo " ####### Configuration de GIT : "
echo "  # Git email ( xx@xx.xx ) : "
read emailGit
echo "  # Git user.name ( prenom NOM ) : "
read emailName

sed "s/REPLACEMAIL/$emailGit/g" git.d/.gitconfig > git.d/.gitconfig.edit 
sed "s/REPLACENAME/$emailName/g" git.d/.gitconfig.edit > git.d/.gitconfig.config

cp git.d/.gitconfig.config $DESTCONF

rm git.d/.gitconfig.edit
rm git.d/.gitconfig.config

echo " --> INSTALLATION DE LA CONFIGURATION DE GIT : OK"
