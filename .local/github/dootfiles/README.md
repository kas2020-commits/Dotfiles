# Setting up a Linux Box:
This file is meant to outline things that I personally need to do after a fresh
install. Since I mainly use Fedora and Arch I will target those distros but this
is mainly distro-agnostic, so feel free to look over and maybe something here
will help you.

## General stuff:

### Links
- https://github.com/philc/vimium // vim add-on to browser
- https://github.com/LukeSmithxyz/voidrice // Luke Smith's configs, which have a
  lot of extras at the cost of more complex setup. Not very modular to the new.
- https://wiki.archlinux.org/index.php/List_of_applications // list of apps
- https://github.com/hlissner/doom-emacs // doom emacs config. Works amazing for
  vim users
- https://wiki.archlinux.org/index.php/Installation_guide // official guide
- https://www.youtube.com/watch?v=-zb8220uUiA // This seems to be the easiest efi method, and is also easy to follow
- https://github.com/rafaelmardojai/firefox-gnome-theme // a theme for firefox
  to make it look more like a gnome app. Actually cool but not as functional IMO
- https://wiki.archlinux.org/index.php/Mouse_acceleration // setting up mouse
  acceleration settings for generic xorg
- https://aur.archlinux.org/packages/yay/ // AUR helper
- https://github.com/cdown/clipmenu // clipmenu script that uses dmenu

### Coming from a previous install
- `pacman -Qnqe > /path/to/packages.txt`
- `sudo pacman -S --needed - < /path/to/packages.txt`

### Setting up Kernels
It is almost always advised to have at least 2 kernels available to boot from,
in the case that something goes wrong. The obvious choices here are the normal
and lts kernels, but those aren't the only choices. The zen kernel, and the
hardened kernel are really good niche choices too. These commands will setup a
systemd-boot efi system:

- `bootctl --path=/boot install` // assuming your boot partition is located here
- Now add a file in "--path"/loader and add the following parameters:
  - `default arch-*` // This will take a wildcard file starting with arch- from
    the dir "--path"/loader/entries
  - `timeout 1` // for if you will have more than 1 kernel available
    (recommended).
- now cd into entries folder and add a file called "arch.conf" or something else
  as long as it is a default. Add the following to it:
title	Arch Linux
linux	/vmlinuz-linux
initrd	/amd-ucode.img
initrd	/initramfs-linux.img
options root=UUID=FIND_ THE_ UUID_ OF_ YOUR_ ROOT_ PARTITION rw

- Make sure to remove or change initrd /amd-ucode.img to intel if you have intel
  microcode, or remove the line if you have neither.
- For things like lts or zen kernel look for the .img and /vmlinuz files in the
  directory above entries. Simple as that!

If you were using grub before now, just remove that; it's bloat (hehe)

### Ranking mirrors (Pacman/Arch)
- `# cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup`
- remove as many mirrors from the backup version that you know will be slow
  (countries far away, etc.)
- `# rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/rankings`
- look at the rankings file and double-check to see if it makes sense
- `# mv /etc/pacman.d/rankings /etc/pacman.d/mirrorlist`

### Setting up internet
You can either chose *dhcpd* or *NetworkManager*, although most prepackaged
distros will have both. If neither are installed, pick one and enable it using
the command `# systemctl enable NetworkManager.service`


You can also add the following to the bottom of /etc/dhcpcd.conf:
- `noarp`
- `static domain_name_servers=1.1.1.1 1.0.0.1`

### Adding a user
`# useradd -m -G wheel -s /bin/zsh USERNAME_HERE`, where -m creates the home
directory, -G adds user to group wheel, -s choses the shell. Make sure that the
shell path is valid by `cat /etc/shells`

### Using doas rather than sudo
install the `opendoas` package and run `sudo echo -e "permit $USER as root" >> /etc/doas.conf`.
Obviously run this as the user you want to give root privellages.

You can also just, you know, run `su root` when you need root privellages. Then
you wouldn't need either sudo or doas.

### setting up ssh keys for stuff like github
- make sure openssh is installed first
- `ssh-keygen -t rsa -b 4096 -C "your_email@example.com"`
- `ssh-add ~/.ssh/id_rsa` //this assumes the default location
- `cat ~/.ssh/id_rsa.pub` //copy paste the contents into your github and boom

### auto-mounting drives
- `# lsblk` or `sudo fdisk -l` will help you find the partition you want to auto-mount
- `# blkid` //This finds the UUID of your partition (this doesn't change for the drive unless you change partition scheme
- `# echo "UUID=FIND UUID AND PLACE HERE /path/to/mount/point       auto nosuid,nodev,x-gvfs-show 0 0" >> /etc/fstab`

### Nvidia
- https://wiki.archlinux.org/index.php/NVIDIA
- https://rpmfusion.org/Howto/NVIDIA

#### Fedora (RPMfusion needed)
- `sudo dnf upgrade -y`
- `sudo dnf install akmod-nvidia`
- `sudo dnf install xorg-x11-drv-nvidia-cuda` // optional for cuda/nvec support

#### Arch
- for most desktop users with a modern nvidia card and no other graphics:
    - `sudo pacman -S nvidia nvidia-lts nvidia-settings`
    - reboot
    - `nvidia-xconfig` // run in root shell i.e. sudo su first
- If you have any problems, follow the archwiki link and troubleshoot. Most likely you will need to add the boot option to boot with neavou driver instead.
- Make sure to change the settings in opengl to prefer maximum performance. It
  makes everything snappier and worth it.
- If you want to use custom kernels you need the `nvidia-dkms` package, which
  will replace `nvidia` and `nvidia-lts` packages (make sure to have the header
  packages of the kernels you want the dkms modules to use!! Else it won't
  recognize the kernel. Run `dkms status` to see what dkms modules are online
  and `dkms autoinstall` to run through refreshing things.)

### My preferred list of user apps and packages

| Category             | Name                |
|----------------------|---------------------|
| Terminal             | st                  |
| File manager         | nnn                 |
| shell                | zsh                 |
| kernel               | zen                 |
| application launcher | dmenu               |
| music                | cmus                |
| video                | mpv                 |
| Email                | geary               |
| Pocasts              | gnome-podcasts      |
| Torrenting           | Transmission-gtk    |
| Image Viewing        | sxiv                |
| Document Reader      | zathura-pdf-poppler |

- A note for zsh: run `$ mkdir -p ~/.cache/zsh` or else you wont get history
- You can find my st build as one of my repos. You can look at the README if
  you're interested

### Codecs, background libs, and other niceties
| Name               | Description                              |
|--------------------|------------------------------------------|
| Playerctl          | media control                            |
| ntfs-3g            | to read-write with windows filesystems   |
| tlp                | laptop cpu control and power manager     |
| aspell aspell-en   | spell checking and dictionary            |
| arc-gtk-theme      | self explanitory                         |
| papirus-icon-theme | self explanitory                         |
| trash-cli          | cli app to manage a freedesktop trashcan |

### Extensive font list:
These are the names of the packages in arch but it's pretty easy to find the
same package from other distros like fedora. Install what you need
- ttf-dejavu
- ttf-ubuntu-font-family
- ttf-hack
- ttf-inconsolata
- ttf-anonymous-pro
- adobe-source-code-pro-fonts
- noto-fonts
- ttf-liberation
- ttf-croscore
- otf-font-awesome
- bdf-unifont
- noto-fonts-emoji

### Names of compilers (yes I am that forgetful)
| Compiler         | Use           |
|------------------|---------------|
| Marked           | Markdown      |
| Texlive          | Latex         |
| GCC / Clang      | C / C++ / etc |
| R-core / R-devel | R             |
| R-markdown       | R-markdown    |
| Octave           | Matlab        |
| Clisp            | lisp          |

## dwm Setup:
### Installing needed packages
- `picom` // used to be called compton
- `pulseaudio pulseaudio-alsa`
- `scrot`
- `xdotool`
- `imagemagick`
- `dmenu`
- `unzip`
- `clipmenu`
- `xclip`
- `lxappearance-gtk3`
- `xorg-xinit`
- `pamixer`
- `sxhkd`
- `xorg-xsetroot`
### Random setup stuff
- `mkdir ~/Pictures/Screenshots`
- add this to `/etc/X11/xorg.conf.d/50-mouse-acceleration.conf`:

Section "InputClass"
        Identifier "My Mouse"
        Driver "libinput"
        MatchIsPointer "yes"
        Option "AccelProfile" "flat"
        Option "AccelSpeed" "0"
EndSection

- get the *.xinitrc*, *.xprofile*, and *sxhkd* files setup as a base requirement

### bluetooth setup
- `sudo pacman -S bluez bluez-utils`
- `sudo systemctl enable bluetooth.service`
- Reboot, then run bluetoothctl in a terminal to pair devices
### Themes / icons
- https://www.gnome-look.org/p/1148692/ or install package 'capitaine-cursors'
- https://www.gnome-look.org/p/1214931/ for flat-remix-blue theme. Thanks kanye! Very cool.

# Depreciated stuff:
## Gnome Setup:
### Login Manager
- gnome uses its own login manager called *gdm*. To use it (recommended), run
`sudo systemctl enable gdm`
- For Xorg users i.e. nvidia users, if you're having trouble with gdm,
under /etc/gdm/custom.conf, uncomment "#WaylandEnable=false"

### List of (unneeded) gnome apps that make the experience nicer
- `gnome-tweaks`
- `gnome-calender`
- `gnome-clocks`
- `gnome-weather`
- `gnome-calculator`
- `gnome-feeds`
- `eog` // eye of gnome
- `geary`
- `evince`
### Removable bloat
- `cheese`
- `gnome-software`
- `gnome-terminal` // debatable
- `gnome-character`
- `totem`
- `yelp`
- `epiphany`
- `gnome-todo`
- `gnome-boxes`
- `baobab`
- `gnome-logs`
- `vino`

## Doom Emacs Setup stuff
- move the .doom.d/ contents or pick out specific setting changes
- run `~/.emacs.d/bin/doom refresh` // you can also replace refresh with help
  for more commands
- Change the pdf opener to use `xdg-open` (tex-view-program-selection)
