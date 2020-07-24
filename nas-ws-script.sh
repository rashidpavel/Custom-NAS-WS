
rm -rf /etc/apt/sources.list && 

### Install openmediavault ####
cat <<EOF >> /etc/apt/sources.list.d/openmediavault.list
deb https://packages.openmediavault.org/public usul main
EOF

export LANG=C.UTF-8 &&
export DEBIAN_FRONTEND=noninteractive &&
export APT_LISTCHANGES_FRONTEND=none &&
wget -O "/etc/apt/trusted.gpg.d/openmediavault-archive-keyring.asc" https://packages.openmediavault.org/public/archive.key &&
apt-key add "/etc/apt/trusted.gpg.d/openmediavault-archive-keyring.asc" &&
apt-get update &&
apt-get --yes --auto-remove --show-upgraded \
    --allow-downgrades --allow-change-held-packages \
    --no-install-recommends \
    --option Dpkg::Options::="--force-confdef" \
    --option DPkg::Options::="--force-confold" \
    install openmediavault-keyring openmediavault &&


# Populate the database.
omv-confdbadm populate &&

wget -O install.sh http://www.aapanel.com/script/install-ubuntu_6.0_en.sh && 
bash install.sh aapanel &&


