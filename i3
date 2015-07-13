# vim:filetype=i3

# set mod to Win key
set $mod Mod4

# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below. ISO 10646 = Unicode
font -misc-fixed-medium-r-normal--13-120-75-75-C-70-iso10646-1
# chose a FreeType font, such as:
font pango: Ubuntu Mono 18px

# set workspaces
set $WS1 work
set $WS2 term
set $WS3 web
set $WS4 media
set $WS5 chat 

# switch to workspace
bindsym $mod+1 workspace $WS1
bindsym $mod+2 workspace $WS2
bindsym $mod+3 workspace $WS3
bindsym $mod+4 workspace $WS4
bindsym $mod+5 workspace $WS5

# scratchpad
bindsym $mod+Shift+s move scratchpad
bindsym $mod+s scratchpad show

# borders
for_window [class="^.*"] border pixel 5
client.focused          #565E65 #565E65 #565E65 #565E65
client.unfocused        #1C2023 #1C2023 #ebdbb2 #323232
client.focused_inactive #1C2023 #1C2023 #ebdbb2 #323232
client.urgent           #C79595 #C79595 #ee0000 #383a3b
# hide_edge_borders both
# new_float pixel 0
# new_window pixel 0
# smart_borders on

# start a terminal
bindsym $mod+Return exec urxvt
bindsym $mod+Shift+Return exec gnome-terminal

# start other apps directly
bindsym $mod+Shift+f exec firefox
bindsym $mod+Shift+t exec thunderbird
bindsym $mod+Shift+w exec lowriter
bindsym $mod+Shift+v exec xterm -e vim
bindsym $mod+Shift+p exec plover

# start dmenu (a program launcher)
bindsym $mod+space exec dmenu_run

# kill focused window
bindsym $mod+q kill
bindsym $mod+c kill

# change focus
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+z split h

# split in vertical orientation
bindsym $mod+v split v

# change container layout (stacked, tabbed, toggle split)
#bindsym $mod+s layout stacking
#bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# Use Mouse+$mod to drag floating windows
floating_modifier $mod

# change focus between tiling / floating windows
#bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace $WS1
bindsym $mod+Shift+2 move container to workspace $WS2
bindsym $mod+Shift+3 move container to workspace $WS3
bindsym $mod+Shift+4 move container to workspace $WS4
bindsym $mod+Shift+5 move container to workspace $WS5

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session)
bindsym $mod+Shift+r restart
# kills the X session
bindsym $mod+Shift+e exec pkill -u $USER 

# resize focused window
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym h resize shrink width 10 px or 10 ppt
        bindsym j resize grow height 10 px or 10 ppt
        bindsym k resize shrink height 10 px or 10 ppt
        bindsym l resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}

bindsym $mod+r mode "resize"

#gaps
gaps inner 45
gaps outer 0

# gaps mode

set $mode_gaps Gaps: (o) outer, (i) inner
set $mode_gaps_outer Outer Gaps: +|-|0 (local), Shift + +|-|0 (global)
set $mode_gaps_inner Inner Gaps: +|-|0 (local), Shift + +|-|0 (global)
bindsym $mod+Shift+g mode "$mode_gaps"

mode "$mode_gaps" {
        bindsym o      mode "$mode_gaps_outer"
	bindsym i      mode "$mode_gaps_inner"
	bindsym Return mode "default"
	bindsym Escape mode "default"
}

mode "$mode_gaps_inner" {
	bindsym plus  gaps inner current plus 5
	bindsym minus gaps inner current minus 5
	bindsym 0     gaps inner current set 0

	bindsym Shift+plus  gaps inner all plus 5
	bindsym Shift+minus gaps inner all minus 5
	bindsym Shift+0     gaps inner all set 0

	bindsym Return mode "default"
	bindsym Escape mode "default"
}
mode "$mode_gaps_outer" {
	bindsym plus  gaps outer current plus 5
	bindsym minus gaps outer current minus 5
	bindsym 0     gaps outer current set 0

	bindsym Shift+plus  gaps outer all plus 5
	bindsym Shift+minus gaps outer all minus 5
	bindsym Shift+0     gaps outer all set 0

	bindsym Return mode "default"
	bindsym Escape mode "default"
}



# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)

bar {
mode dock
tray_output none
position bottom
workspace_buttons yes
font pango: Liberation Sans 22px
colors  {
        background #1C2023
	statusline #C7CCD1
			#BORDER #BACKGROUND #TEXT
        focused_workspace #292929  #F3F4F5 #1C2023
	inactive_workspace #252525 #1C2023 #F3F4F5

        urgent_workspace #b492b6 #C79595 #1C2023
	} 
}

# floating classes for_window 
for_window [class="Plover"] floating enable 
for_window [class="File-roller"] floating enable
for_window [class="Pcmanfm"] floating enable

#Wallpaper
exec nitrogen --set-scaled Pictures/wallpaper.png
# fix urxvt
exec xrdb ~/.Xresources
exec xcompmgr

# misc startup stuff
exec unclutter -grab &
exec pkill nautilus

#test stuff
exec pkill dunst
exec notify-osd
