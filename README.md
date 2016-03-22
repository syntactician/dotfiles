## Dotfiles

This is (among other things) my attempt at synchronizing my dotfiles across
several machines. If you happen to like or have questions about anything you
see here feel free to [hit me up](mailto:ehernandez@email.wm.edu).

### Structure

This repository is now set up for use with [GNU Stow](https://www.gnu.org/software/stow/).  
It assumes that it is a direct subdirectory of `$HOME` and that `$XDG_CONFIG_HOME` is `.config`.

### Programs

- **Operating system**: [Arch Linux](http://archlinux.org)
- **Interactive shell**: [zsh](http://zsh.sourceforge.net/)
- **Scripting shell**: [dash](https://wiki.archlinux.org/index.php/Dash)
- **Text editor**: [neovim](http://neovim.io)
- **Email client**: [mutt](http://www.mutt.org/)
- **Terminal emulator**: [st](http://st.suckless.org)
	- [urxvt](http://software.schmorp.de/pkg/rxvt-unicode.html) as needed
- **Colorscheme**: [Base16 Ocean](http://chriskempson.github.io/base16#ocean)
- **Browser**: [firefox](https://www.mozilla.org/firefox/) with [vimperator](http://www.vimperator.org/)
- **Window manager**: [nowm](http://github.com/syntactician/nowm)
	- **Key binder**: [sxhkd](https://github.com/baskerville/sxhkd)
	- **Panel**: [lemonbar](https://github.com/LemonBoy/bar)
	- **Launcher**: [dmenu](https://dmenu.suckless.org)
	- **Screenlocker**: [slock](https://tools.suckless.org/slock)
	- **Wallpaper-er**: [hsetroot](https://slackbuilds.org/repository/13.37/desktop/hsetroot/)
	- **GTK**: [arc](https://github.com/horst3180/arc-theme) as needed
	- there's also a legacy config for [i3](https://i3wm.org/)

### TODO

- [ ] Build a computer and install this setup on bare metal.
- [ ] Try out [Crux](http://crux.nu).
- [ ] Try out [bspwm](https://github.com/baskerville/bspwm).
- [ ] Try out [yabar](https://github.com/geommer/yabar)
- [ ] Document my setup.
	- [ ] Flesh out this README.
	- [ ] Comment in the individual configs.

#### Current setup:
![nowm on Arch](screen.png)
