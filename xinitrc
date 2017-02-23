DEFAULTSESSION=cinnamon-session-cinnamon


#vola slime s parametrom nazvu DE

userresources=$HOME/.Xresources
# merge with whats available
if [ -f "$userresources" ]; then
        xrdb "$userresources"
fi


#exec startxfce4
#exec i3

case "$1" in
     startxfce4) exec "$1" ;;
     cinnamon-session-cinnamon) exec "$1" ;;
     i3) exec i3 ;;
     *) exec $DEFAULTSESSION ;;
esac
