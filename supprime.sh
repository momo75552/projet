sudo fdisk -l
echo "entrer le disque à suprimer"
read sup
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << FDISK_CMDS  | sudo fdisk /dev/sda
l
 d
 $sup # Partition number
 w # Write changes
q   # write partition table and exit
FDISK_CMDS

