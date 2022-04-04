#!/bin/sh

# No timeout, no mitigations.
sudo sed -i 's/^GRUB_TIMEOUT=.$/GRUB_TIMEOUT=0/' /etc/default/grub
sudo sed -i 's/^GRUB_CMDLINE_LINUX=""$/GRUB_CMDLINE_LINUX="mitigations=off"/' /etc/default/grub
sudo update-grub
