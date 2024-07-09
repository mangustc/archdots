# Boot

## Required packages

```
yay -S amd-ucode
```

## Installation

As superuser:

```sh
cp -vr ./entries /boot/loader/entries
cp -vr ./loader.conf /boot/loader/loader.conf

bootctl install
bootctl update
```
