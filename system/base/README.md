# Base

## Required packages

```sh
yay -S --needed doas git networkmanager amd-ucode base base-devel linux-firmware ripgrep tldr fzf fish neovim stow kitty hyprland
```

## Installation

### Installing base system

As superuser (replace {username} with user name):

```sh
usermod -aG audio,input,video,wheel {username}
systemctl enable NetworkManager.service
```

Include `permit nopass :wheel as root` in `/etc/doas.conf` configuration file.

### Installing paru

As {username}:

```sh
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

Include `SkipReview` option under \[options\] in `/etc/paru.conf` configuration file.

Include `Sudo = doas` binary option under \[bin\] in `/etc/paru.conf` configuration file.
