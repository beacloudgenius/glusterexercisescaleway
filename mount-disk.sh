# scaleway https://www.scaleway.com/docs/attach-and-detach-a-volume-to-an-existing-server/

#umount -f /mnt/gluster
df -h

#mkfs -t ext4 /dev/vdb  #vultr
mkfs -t ext4 /dev/nbd1  #scaleway

rm -rf /srv/gluster/brick && mkdir -p /srv/gluster/brick

echo "/dev/nbd1 /srv/gluster/brick auto defaults,nofail,errors=remount-ro 0 2" >> /etc/fstab  # scaleway
#echo "/dev/vdb /srv/gluster/brick ext4 defaults,noatime 0 0" >> /etc/fstab # vultr

mount -a && df -h
