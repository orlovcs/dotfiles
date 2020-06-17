# MacbookPro-12,1 

## Keys
Mod4 as the command key.
QNeed to swap control and command.

## Resolution
In ~/.Xresources:
#Resolution scaling at 200%

echo "Xft.dpi: 192" > ~/.Xresources



## dmenu krunner alternative
set $menu --no-startup-id qdbus org.kde.krunner /App display
bindsym $mod+d exec $menu
 