#MacbookPro-12,1 

##Keys
Mod4 as the command key.
Need to swap control and command.

##Resolution
In ~/.Xresources:
#Resolution scaling at 200%
Xft.dpi: 192

##dmenu krunner alternative
set $menu --no-startup-id qdbus org.kde.krunner /App display
bindsym $mod+d exec $menu
