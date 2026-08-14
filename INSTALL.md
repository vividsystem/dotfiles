# Install
This installs all packages that are not already installed necessary for this config to work:
```bash
pacman -S --needed - < scripts/packages.txt
```
> [!NOTE]
> Microcode for Intel/AMD or graphics drivers are not included in `scripts/packages.txt`.
> For microcode use either `intel-ucode` or `amd-ucode`.
> For graphics driver use either `mesa` (for Intel and AMD) or `nvidia-open`.

You will also need to install [ohmyzsh](https://ohmyz.sh/)

Copy the config via stow:
```bash
git clone --recurse-submodules https://github.com/vividsystem/dotfiles
stow */
```

## DNS
`/etc/systemd/resolved.conf`
I recommend using [quad9](quad9.net)
```
DNS=9.9.9.11#dns11.quad9.net 149.112.112.11#dns11.quad9.net 2620:fe::11#dns11.quad9.net 2620:fe::fe:11#dns11.quad9.net
FallbackDNS=9.9.9.9#dns.quad9.net 149.112.112.112#dns.quad9.net 2620:fe::fe#dns.quad9.net 2620:fe::9#dns.quad9.net
DNSSEC=true
DNSOverTLS=yes
```
## NetworkManager Config
iwd is the better wifi backend so you should use it:
`/etc/NetworkManager/conf.d/wifi_backend.conf`
```
[device]
wifi.backend=iwd
wifi.iwd.autoconnect=false
```


## SecureBoot
To use secure boot set it up via `sbctl`
You need to be in setup mode in your BIOS to change these settings.
```bash
sbctl status
sbctl enroll-keys -f -m
sbctl verify
sbctl sign -s /boot/vmlinuz-linux # and all other files from verify
```
Then re-install your bootloader (GRUB):
```
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB --modules="tpm" --disable-shim-lock
grub-mkconfig -o /boot/grub/grub.cfg
```
You should set a BIOS password! Otherwise secureboot can just be disabled!

