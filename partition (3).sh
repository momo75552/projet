sudo fdisk -l
echo "entrer le disque à crée"
read partition
 sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << FDISK_CMDS  | sudo fdisk  /dev/sda

 o # Create a new empty DOS partition table
 n # Add a new partition
 p # Primary partition
 $partition # Partition number
   # First sector (Accept default: 1)
   # Last sector (Accept default: varies)
 w # Write changes
q   # write partition table and exit
FDISK_CMDS
