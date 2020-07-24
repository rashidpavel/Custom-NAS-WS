
apt update && apt -y install gnupg curl wget apt-transport-https dirmngr &&
rm -rf /etc/apt/sources.list && 
wget https://raw.githubusercontent.com/rashidpavel/Custom-NAS-WS/master/sources.list && mv sources.list /etc/apt/

curl -L https://packagecloud.io/AtomEditor/atom/gpgkey | apt-key add -
wget http://www.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/deb-multimedia-keyring_2016.8.1_all.deb && dpkg -i deb-multimedia-keyring_2016.8.1_all.deb
apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 3766223989993A70
apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys E58A9D36647CAE7F

wget https://gandalfn.ovh/debian/pool/main/p/pantheon-debian-repos/pantheon-debian-repos_5.0-0+pantheon+buster+juno1_all.deb &&
dpkg -i pantheon-debian-repos_5.0-0+pantheon+buster+juno1_all.deb &&


### Install openmediavault ####
cat <<EOF >> /etc/apt/sources.list.d/openmediavault.list
deb https://packages.openmediavault.org/public usul main
EOF

export LANG=C.UTF-8 &&
export DEBIAN_FRONTEND=noninteractive &&
export APT_LISTCHANGES_FRONTEND=none &&
wget -O "/etc/apt/trusted.gpg.d/openmediavault-archive-keyring.asc" https://packages.openmediavault.org/public/archive.key &&
apt-key add "/etc/apt/trusted.gpg.d/openmediavault-archive-keyring.asc" &&
apt-get update && apt-get -y dist-upgrade &&
apt-get --yes --auto-remove --show-upgraded \
    --allow-downgrades --allow-change-held-packages \
    --no-install-recommends \
    --option Dpkg::Options::="--force-confdef" \
    --option DPkg::Options::="--force-confold" \
    install openmediavault-keyring openmediavault && apt -y install pantheon pantheon-shell tasksel task-desktop gdm3 gcc make build-essential


# Populate the database.
omv-confdbadm populate &&

wget -O install.sh http://www.aapanel.com/script/install-ubuntu_6.0_en.sh && 
bash install.sh aapanel &&

reboot




