#!/bin/bash

echo "Début de la mise à jour de la configuration vsftpd..."

# Mise à jour de la configuration vsftpd avant de démarrer le serveur
sed -i -r "s/#write_enable=YES/write_enable=YES/1" /etc/vsftpd.conf
echo "Configuration: write_enable=YES"
sed -i -r "s/#chroot_local_user=YES/chroot_local_user=YES/1" /etc/vsftpd.conf
echo "Configuration: chroot_local_user=YES"

echo "Ajout de configurations supplémentaires à vsftpd.conf..."
echo "
local_enable=YES
allow_writeable_chroot=YES
pasv_enable=YES
pasv_min_port=40000
pasv_max_port=40005
userlist_enable=YES
userlist_file=/etc/vsftpd.userlist
userlist_deny=NO" >> /etc/vsftpd.conf

echo "Configuration de l'utilisateur FTP..."
# Configuration de l'utilisateur FTP
echo -e "$FTP_PASSWORD\n$FTP_PASSWORD\n" | adduser --gecos "" --home /home/$FTP_USER --shell /bin/bash $FTP_USER
echo "Utilisateur $FTP_USER ajouté."

echo "Ajout de $FTP_USER à vsftpd.userlist..."
echo "$FTP_USER" | tee -a /etc/vsftpd.userlist

echo "Configuration des répertoires pour $FTP_USER..."
mkdir -p /home/$FTP_USER/ftp/files
chown nobody:nogroup /home/$FTP_USER/ftp
chmod a-w /home/$FTP_USER/ftp
chown $FTP_USER:$FTP_USER /home/$FTP_USER/ftp/files
echo "Répertoires configurés."

echo "Correction du chemin local_root dans vsftpd.conf pour $FTP_USER..."
# Correction du chemin local_root pour qu'il corresponde à l'utilisateur FTP
sed -i "s|local_root=/home/vfuster-/ftp|local_root=/home/$FTP_USER/ftp|" /etc/vsftpd.conf

echo "Création du répertoire secure_chroot_dir pour vsftpd..."
mkdir -p /var/run/vsftpd/empty
chown root:root /var/run/vsftpd/empty
chmod 755 /var/run/vsftpd/empty

echo "Tentative de démarrage de vsftpd en avant-plan..."
# Démarrage de vsftpd en avant-plan
exec /usr/sbin/vsftpd /etc/vsftpd.conf




