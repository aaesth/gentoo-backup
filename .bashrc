# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.

if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec dbus-run-session hyprland
    exec wireplumber
fi

alias vencord="sh -c "$(curl -sS https://vencord.dev/install.sh)""
alias win10="sudo /etc/libvirt/hooks/qemu win10 prepare begin - && sudo virsh start win10"
export PATH=$PATH:/home/lain/.spicetify
export PATH=/home/lain/.local/bin:$PATH