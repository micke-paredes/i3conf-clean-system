sudo mkdir -p /srv/samba
sudo chmod -R 755 /srv/samba
sudo chown -R  nobody:nobody /srv/samba
sudo chcon -t samba_share_t /srv/samba
sudo mv /etc/samba/smb.conf /etc/samba/smb.conf.bak
sudo cat > /etc/samba/smb.conf << "EOL"
[global]
workgroup = WORKGROUP
server string = Samba Server %v
netbios name = rocky-8
security = user
map to guest = bad user
dns proxy = no
ntlm auth = true
[Public]
path =  /srv/samba
browsable =yes
writable = yes
guest ok = yes
read only = no
EOL

sudo testparm

sudo systemctl start smb
sudo systemctl enable smb
sudo systemctl start nmb
sudo systemctl enable nmb

sudo systemctl status smb
sudo systemctl status nmb

sudo firewall-cmd --info-service samba
sudo firewall-cmd --permanent --add-service=samba

firewall-cmd --reload
