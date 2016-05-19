# ne rien faire en mode non interactif
[ -z "$PS1" ] && return

##############
# Exports
##############
# ne pas mettre en double dans l'historique les commandes tapées 2x
export HISTCONTROL=ignoredups
# lignes de l'historique par session bash
export HISTSIZE=5000
# lignes de l'historique conservées
export HISTFILESIZE=20000
# Pour définir l'éditeur par défaut utilisé par de nombreuses commandes (vipw, visudo, less, cvs, svn...) :
export EDITOR=vim # ou nano / emacs
# Ne pas garder les trucs inutiles dans les logs (attention peut casser certaines habitudes)
export HISTIGNORE="cd:ls:[bf]g:clear"
# Pour avoir le man en couleur
#export PAGER=most
ISGRAPHIC=`which Xorg` >> /dev/null
if [ $? == 0 ] ; then
# Pour ne pas avoir les bips systèmes
xset -b
# Toujours forcer clavier FR
setxkbmap fr
fi
##############
# Tips console
##############
# Correction automatique des petites typos
shopt -s cdspell
# supporte des terminaux redimensionnables (xterm et screen -r)
shopt -s checkwinsize
#Pour permettre de taper des caractères accentués dans le shell :
bind 'set convert-meta off'
# utilisation des couleurs pour certaines commandes
#eval "`dircolors -b`"
#Ajouter ~/bin dans le PATH si celui-ci existe (indispensable)
if [ -d ~/bin ] ; then  PATH=~/bin:"${PATH}"; fi
# permettre une complétion plus "intelligente" des commandes (question de goût)
if [ -f /etc/bash_completion ]; then  . /etc/bash_completion; fi

##############
# Alias
##############
# Ls rapide
alias l='ls -la --color'
alias ll='ls -la --color'
alias lla='ls -hFoa --color'
alias grep='grep --color=auto'
# Pour les tape vite
alias cd..='cd ..'
alias grpe='grep'
alias mroe='more'
alias iv='vi'
alias tial='tail'
alias xs='cd'
alias vf='cd'
alias exitr='exit'
alias mm='ll'
alias vom='vim'
alias cim='vim'
# Autre tips
alias dusort='du -x --block-size=1048576 | sort -nr'
alias c='clear' # Parfois plus facile à atteindre que le ^L
alias ..=' cd ..'
# Alias pour APT
alias aptins='apt-get install'
alias aptsea='apt-cache search'
alias aptup='apt-get update'
alias yumup='yum update'
alias yumsea='yum search'
alias yumins='yum install'

alias meteoToulouse='curl http://www.wttr.in/Toulouse'
alias meteoPerpignan='curl http://www.wttr.in/Perpignan'

##############
# Fonctions
##############
# Cat couleur 1
m_cat (){ 
	cat $1 |ccze -A
}
# Mise en forme du find dans le rep courant
m_find(){
	find ./ -name "$1" -exec ls -la {} \;
}
# Logs coloré
m_log(){
	tail -f $1 |ccze -A 
}

# lecture colorée de logs
m_log_cat(){
	cat < $1 |ccze -A
}

# Colorier le man
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}

##############
# Memo des couleurs
##############
#BLACK=		\e[0;30m\]#BLUE= 	\e[0;34m\]#CYAN= 	\e[0;36m\]#RED= 		\e[0;31m\]#PURPLE= 	\e[0;35m\]#BROWN=	\e[0;33m\]#LIGHTGRAY=	\e[0;37m\]
#LIGHTBLUE=	\e[1;34m\]#LIGHTPURPLE=	\e[1;35m\]#YELLOW=	\e[1;33m\]#
NC='\e[0m'
GREEN='\e[0;32m'
DARKGRAY='\e[1;30m'
LIGHTGREEN='\e[1;32m'
LIGHTCYAN='\e[1;36m'
LIGHTRED='\e[1;31m'
WHITE='\e[1;37m'


##############
# Prompt
##############
# Mise en forme coloré
#PS1="\[\e[0;35m\]\D{%H:%M:%S} \[\e[0;32m\]\[\e[1;31m\]\u\[\e[1;36m\]@\h:\[\e[1;32m\]\w\[\e[0;31m\]★\[\e[m\]   "
#PS1="┌—————\D{%H:%M:%S} \[\e[0;32m\]\[\e[1;31m\]\u\[\e[1;36m\]@\h:\[\e[1;32m\]\w\[\e[0;35m\]\n└★ \[\e[m\]   "
#PS1="\[$WHITE\]┌—————(\D{%H:%M:%S}) - \[$LIGHTGREEN\] \[$LIGHTRED\]\u\[$LIGHTCYAN\]@\h \[$LIGHTGREEN\]\w    \n\[$WHITE\]└★ \[$NC\] "
PS1="\[$WHITE\]┌——(\D{%H:%M:%S}) \[$LIGHTGREEN\]\[$LIGHTRED\]\u\[$LIGHTCYAN\]@\h \[$LIGHTGREEN\]\w\[$WHITE\] ░> \[$NC\] "


