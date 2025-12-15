# JKG-SERVER — BIBLIA (snapshot 2025-12-15-175448)

**Hostname:** JKG-SERVER
**Fecha:** 2025-12-15T17:54:48+01:00
**IPv4:** [IP-REDACTED]/24,[IP-REDACTED]/32,[IP-REDACTED]/16,[IP-REDACTED]/16,[IP-REDACTED]/16,[IP-REDACTED]/16,[IP-REDACTED]/16
**IPv6:** fd87:7b42:69e:0:725a:fff:fe4a:bc13/64,fd7a:115c:a1e0::3401:ba86/128

> Modo redactado: intenta ocultar secretos automáticamente.


## Sistema

$ uname -a; echo; (lsb_release -a 2>/dev/null || cat /etc/os-release)
Linux JKG-SERVER 6.8.0-90-generic #91-Ubuntu SMP PREEMPT_DYNAMIC Tue Nov 18 14:14:30 UTC 2025 x86_64 x86_64 x86_64 GNU/Linux

Distributor ID:	Ubuntu
Description:	Ubuntu 24.04.3 LTS
Release:	24.04
Codename:	noble


## Uptime / carga / memoria

$ uptime; echo; free -h; echo; vmstat 1 3 2>/dev/null || true
 17:54:48 up 2 days, 15:32,  4 users,  load average: 0,20, 0,11, 0,11

               total       usado       libre  compartido   búf/caché  disponible
Mem:            46Gi       3,6Gi       2,7Gi       203Mi        41Gi        43Gi
Inter:         4,0Gi          0B       4,0Gi

procs -----------memory---------- ---swap-- -----io---- -system-- -------cpu-------
 r  b   swpd  libre   búf caché   si   so    bi    bo   in   cs us sy id wa st gu
 6  0      0 2832960 1271452 42131572    0    0  2297  1209 1328    9  4  4 91  0  0  0
 0  0      0 2832828 1271452 42131448    0    0     0     8  505  684  1  1 98  0  0  0
 0  0      0 2832828 1271452 42131448    0    0     0     4  318  394  0  1 99  0  0  0


## CPU / RAM (detalle)

$ lscpu 2>/dev/null | sed -n '1,160p' || true; echo; dmidecode -t memory 2>/dev/null | sed -n '1,260p' || true
Arquitectura:                         x86_64
modo(s) de operación de las CPUs:     32-bit, 64-bit
Address sizes:                        39 bits physical, 48 bits virtual
Orden de los bytes:                   Little Endian
CPU(s):                               4
Lista de la(s) CPU(s) en línea:       0-3
ID de fabricante:                     GenuineIntel
BIOS Vendor ID:                       Intel(R) Corporation
Nombre del modelo:                    Intel(R) Core(TM) i5-7500T CPU @ 2.70GHz
BIOS Model name:                      Intel(R) Core(TM) i5-7500T CPU @ 2.70GHz To Be Filled By O.E.M. CPU @ 2.6GHz
BIOS CPU family:                      205
Familia de CPU:                       6
Modelo:                               158
Hilo(s) de procesamiento por núcleo:  1
Núcleo(s) por «socket»:               4
«Socket(s)»                           1
Revisión:                             9
CPU(s) scaling MHz:                   34%
CPU MHz máx.:                         3300,0000
CPU MHz mín.:                         800,0000
BogoMIPS:                             5399,81
Indicadores:                          fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb pti ssbd ibrs ibpb stibp fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear flush_l1d arch_capabilities ibpb_exit_to_user
Caché L1d:                            128 KiB (4 instances)
Caché L1i:                            128 KiB (4 instances)
Caché L2:                             1 MiB (4 instances)
Caché L3:                             6 MiB (1 instance)
Modo(s) NUMA:                         1
CPU(s) del nodo NUMA 0:               0-3
Vulnerability Gather data sampling:   Mitigation; Microcode
Vulnerability Itlb multihit:          KVM: Mitigation: VMX unsupported
Vulnerability L1tf:                   Mitigation; PTE Inversion
Vulnerability Mds:                    Mitigation; Clear CPU buffers; SMT disabled
Vulnerability Meltdown:               Mitigation; PTI
Vulnerability Mmio stale data:        Mitigation; Clear CPU buffers; SMT disabled
Vulnerability Reg file data sampling: Not affected
Vulnerability Retbleed:               Mitigation; IBRS
Vulnerability Spec rstack overflow:   Not affected
Vulnerability Spec store bypass:      [REDACTED] Speculative Store Bypass disabled via prctl
Vulnerability Spectre v1:             Mitigation; usercopy/swapgs barriers and __user pointer sanitization
Vulnerability Spectre v2:             Mitigation; IBRS; IBPB conditional; STIBP disabled; RSB filling; PBRSB-eIBRS Not affected; BHI Not affected
Vulnerability Srbds:                  Mitigation; Microcode
Vulnerability Tsx async abort:        Mitigation; TSX disabled
Vulnerability Vmscape:                Mitigation; IBPB before exit to userspace

# dmidecode 3.5
Getting SMBIOS data from sysfs.
SMBIOS 3.0.0 present.

Handle 0x0000, DMI type 16, 23 bytes
Physical Memory Array
	Location: System Board Or Motherboard
	Use: System Memory
	Error Correction Type: None
	Maximum Capacity: 64 GB
	Error Information Handle: Not Provided
	Number Of Devices: 4

Handle 0x0042, DMI type 17, 40 bytes
Memory Device
	Array Handle: 0x0000
	Error Information Handle: Not Provided
	Total Width: 64 bits
	Data Width: 64 bits
	Size: 16 GB
	Form Factor: DIMM
	Set: None
	Locator: DIMM1
	Bank Locator: ChannelB
	Type: DDR4
	Type Detail: Synchronous Unbuffered (Unregistered)
	Speed: 2400 MT/s
	Manufacturer: Unknown - [0xF70B]
	Serial Number: 0000C300
	Asset Tag:  
	Part Number: DDR-C300            
	Rank: 2
	Configured Memory Speed: 2400 MT/s
	Minimum Voltage: Unknown
	Maximum Voltage: Unknown
	Configured Voltage: 1.2 V

Handle 0x0004, DMI type 17, 40 bytes
Memory Device
	Array Handle: 0x0000
	Error Information Handle: Not Provided
	Total Width: 64 bits
	Data Width: 64 bits
	Size: 8 GB
	Form Factor: DIMM
	Set: None
	Locator: DIMM2
	Bank Locator: ChannelB
	Type: DDR4
	Type Detail: Synchronous Unbuffered (Unregistered)
	Speed: 2400 MT/s
	Manufacturer: Samsung
	Serial Number: 20B4F0E3
	Asset Tag:  
	Part Number: M378A1K43CB2-CRC    
	Rank: 1
	Configured Memory Speed: 2400 MT/s
	Minimum Voltage: Unknown
	Maximum Voltage: Unknown
	Configured Voltage: 1.2 V

Handle 0x0003, DMI type 17, 40 bytes
Memory Device
	Array Handle: 0x0000
	Error Information Handle: Not Provided
	Total Width: 64 bits
	Data Width: 64 bits
	Size: 16 GB
	Form Factor: DIMM
	Set: None
	Locator: DIMM3
	Bank Locator: ChannelA
	Type: DDR4
	Type Detail: Synchronous Unbuffered (Unregistered)
	Speed: 2400 MT/s
	Manufacturer: Unknown - [0xF70B]
	Serial Number: 0000C300
	Asset Tag:  
	Part Number: DDR-C300            
	Rank: 2
	Configured Memory Speed: 2400 MT/s
	Minimum Voltage: Unknown
	Maximum Voltage: Unknown
	Configured Voltage: 1.2 V

Handle 0x0002, DMI type 17, 40 bytes
Memory Device
	Array Handle: 0x0000
	Error Information Handle: Not Provided
	Total Width: 64 bits
	Data Width: 64 bits
	Size: 8 GB
	Form Factor: DIMM
	Set: None
	Locator: DIMM4
	Bank Locator: ChannelA
	Type: DDR4
	Type Detail: Synchronous Unbuffered (Unregistered)
	Speed: 2400 MT/s
	Manufacturer: Samsung
	Serial Number: 2127AAC2
	Asset Tag:  
	Part Number: M378A1K43CB2-CRC    
	Rank: 1
	Configured Memory Speed: 2400 MT/s
	Minimum Voltage: Unknown
	Maximum Voltage: Unknown
	Configured Voltage: 1.2 V



## Discos / FS

$ lsblk -f; echo; df -hT | sed -n '1,160p'; echo; mount | sed -n '1,220p'
NAME                      FSTYPE            FSVER    LABEL        UUID                                   FSAVAIL FSUSE% MOUNTPOINTS
sda                       linux_raid_member 1.2      jkg-server:0 089a8037-005d-ed1a-3915-156e79ed324f                  
└─md0                     ext4              1.0      RAIDDATOS    3e647963-b282-4785-8dcd-a80a8c2cf86b      1,1T    29% /srv/storage
sdb                       linux_raid_member 1.2      jkg-server:0 089a8037-005d-ed1a-3915-156e79ed324f                  
└─md0                     ext4              1.0      RAIDDATOS    3e647963-b282-4785-8dcd-a80a8c2cf86b      1,1T    29% /srv/storage
sdc                       linux_raid_member 1.2      jkg-server:0 089a8037-005d-ed1a-3915-156e79ed324f                  
└─md0                     ext4              1.0      RAIDDATOS    3e647963-b282-4785-8dcd-a80a8c2cf86b      1,1T    29% /srv/storage
nvme0n1                                                                                                                 
├─nvme0n1p1               vfat              FAT32                 17EE-24B6                                   1G     1% /boot/efi
├─nvme0n1p2               ext4              1.0                   4ea8201c-d758-4298-8803-469fd95ffde2      1,6G    10% /boot
└─nvme0n1p3               LVM2_member       LVM2 001              WgfOK0-0cpi-2LYn-NglH-M3w3-McEA-eiBUde                
  └─ubuntu--vg-ubuntu--lv ext4              1.0                   309ae917-489d-4610-9fc5-a85e9a216314    851,4G     6% /

S.ficheros                        Tipo     Tamaño Usados  Disp Uso% Montado en
tmpfs                             tmpfs      4,7G    28M  4,7G   1% /run
efivarfs                          efivarfs   150K    82K   64K  57% /sys/firmware/efi/efivars
/dev/mapper/ubuntu--vg-ubuntu--lv ext4       914G    53G  852G   6% /
tmpfs                             tmpfs       24G      0   24G   0% /dev/shm
tmpfs                             tmpfs      5,0M      0  5,0M   0% /run/lock
/dev/md0                          ext4       1,8T   503G  1,2T  31% /srv/storage
/dev/nvme0n1p2                    ext4       2,0G   198M  1,6G  11% /boot
/dev/nvme0n1p1                    vfat       1,1G   6,2M  1,1G   1% /boot/efi
overlay                           overlay    914G    53G  852G   6% /var/lib/docker/overlay2/adf0d1be41bc1942ecb3ccb6c167b9ef9d1d85d8c224f50276051be3009981bc/merged
overlay                           overlay    914G    53G  852G   6% /var/lib/docker/overlay2/24a3f209806ab63891523111392c47ab9dbe6520ce22234cc6d7b1e49d2ce0fe/merged
overlay                           overlay    914G    53G  852G   6% /var/lib/docker/overlay2/7e00853d2d129d9e41dbf5abd2358fb2d8325b62000ea88ba01a344d7fd61e88/merged
overlay                           overlay    914G    53G  852G   6% /var/lib/docker/overlay2/5f8fb40397e598912de8eb679610c8155651a7eab13cee57bc98755ff5b45c32/merged
tmpfs                             tmpfs      4,7G    12K  4,7G   1% /run/user/1000
overlay                           overlay    914G    53G  852G   6% /var/lib/docker/overlay2/f365f677a4b16be7e6c4c75e292c33185047013ae6b52fcba4373bd777383ded/merged
overlay                           overlay    914G    53G  852G   6% /var/lib/docker/overlay2/fafb72caa4a9a75ca069ed353cc024cf4a5b5c40be9a6de8b24a4bb4c52666c9/merged
overlay                           overlay    914G    53G  852G   6% /var/lib/docker/overlay2/f62d744a695615852b3fd25634dd6de0e145ddad0bfe6b408e3e104880827ee9/merged

sysfs on /sys type sysfs (rw,nosuid,nodev,noexec,relatime)
proc on /proc type proc (rw,nosuid,nodev,noexec,relatime)
udev on /dev type devtmpfs (rw,nosuid,relatime,size=24562052k,nr_inodes=6140513,mode=755,inode64)
devpts on /dev/pts type devpts (rw,nosuid,noexec,relatime,gid=5,mode=620,ptmxmode=000)
tmpfs on /run type tmpfs (rw,nosuid,nodev,noexec,relatime,size=4920592k,mode=755,inode64)
efivarfs on /sys/firmware/efi/efivars type efivarfs (rw,nosuid,nodev,noexec,relatime)
/dev/mapper/ubuntu--vg-ubuntu--lv on / type ext4 (rw,relatime)
securityfs on /sys/kernel/security type securityfs (rw,nosuid,nodev,noexec,relatime)
tmpfs on /dev/shm type tmpfs (rw,nosuid,nodev,inode64)
tmpfs on /run/lock type tmpfs (rw,nosuid,nodev,noexec,relatime,size=5120k,inode64)
cgroup2 on /sys/fs/cgroup type cgroup2 (rw,nosuid,nodev,noexec,relatime,nsdelegate,memory_recursiveprot)
pstore on /sys/fs/pstore type pstore (rw,nosuid,nodev,noexec,relatime)
bpf on /sys/fs/bpf type bpf (rw,nosuid,nodev,noexec,relatime,mode=700)
systemd-1 on /proc/sys/fs/binfmt_misc type autofs (rw,relatime,fd=32,pgrp=1,timeout=0,minproto=5,maxproto=5,direct,pipe_ino=4426)
hugetlbfs on /dev/hugepages type hugetlbfs (rw,nosuid,nodev,relatime,pagesize=2M)
mqueue on /dev/mqueue type mqueue (rw,nosuid,nodev,noexec,relatime)
debugfs on /sys/kernel/debug type debugfs (rw,nosuid,nodev,noexec,relatime)
tracefs on /sys/kernel/tracing type tracefs (rw,nosuid,nodev,noexec,relatime)
configfs on /sys/kernel/config type configfs (rw,nosuid,nodev,noexec,relatime)
fusectl on /sys/fs/fuse/connections type fusectl (rw,nosuid,nodev,noexec,relatime)
/dev/md0 on /srv/storage type ext4 (rw,relatime,stripe=256)
/dev/nvme0n1p2 on /boot type ext4 (rw,relatime)
/dev/nvme0n1p1 on /boot/efi type vfat (rw,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=iso8859-1,shortname=mixed,errors=remount-ro)
binfmt_misc on /proc/sys/fs/binfmt_misc type binfmt_misc (rw,nosuid,nodev,noexec,relatime)
overlay on /var/lib/docker/overlay2/adf0d1be41bc1942ecb3ccb6c167b9ef9d1d85d8c224f50276051be3009981bc/merged type overlay (rw,relatime,lowerdir=/var/lib/docker/overlay2/l/DXPD6P76XOO5Y333YNZOFGNJCB:/var/lib/docker/overlay2/l/JJUI6VCPMF4EGRZHEPJDXK3LM7:/var/lib/docker/overlay2/l/HITZRHNM5JLD4XEYPHVKDED2C4:/var/lib/docker/overlay2/l/T45TZ6VXJELKAPNJDSFTV6P7XC:/var/lib/docker/overlay2/l/NCUK4Q2YDRE5DTH3TN4J42T4A2:/var/lib/docker/overlay2/l/AV4K5WBLY5QN5VDDTFFIKMJ4BC:/var/lib/docker/overlay2/l/3TZJAXP75CJGIGDW6XQB5KX274:/var/lib/docker/overlay2/l/RHDKNY4552QVVP3TAYBS7DXSDG,upperdir=/var/lib/docker/overlay2/adf0d1be41bc1942ecb3ccb6c167b9ef9d1d85d8c224f50276051be3009981bc/diff,workdir=/var/lib/docker/overlay2/adf0d1be41bc1942ecb3ccb6c167b9ef9d1d85d8c224f50276051be3009981bc/work,nouserxattr)
overlay on /var/lib/docker/overlay2/24a3f209806ab63891523111392c47ab9dbe6520ce22234cc6d7b1e49d2ce0fe/merged type overlay (rw,relatime,lowerdir=/var/lib/docker/overlay2/l/UKYQ65KLO4IVXCL5A2ISFWMV4L:/var/lib/docker/overlay2/l/EMKRKILOOSQDO7YBQOS6DXVHVM:/var/lib/docker/overlay2/l/JSXR5XDMH5NGS22LXKLI7KE4QU:/var/lib/docker/overlay2/l/UQLEB4TE67UI4BCAFL6H5JXPTQ:/var/lib/docker/overlay2/l/LR77ZVOCPPEPQNQGHRMUYEDW7W:/var/lib/docker/overlay2/l/6TPMGEPIXKK2Y5PPGWLAWZTODW:/var/lib/docker/overlay2/l/NRKDKSWDP7DFS5G364B5XDUXF3:/var/lib/docker/overlay2/l/3LTQI3XCWZ6XO5FIQ6Y6HDYPFL:/var/lib/docker/overlay2/l/5WBCSFPO73343ZZPSMXLNUVWZD,upperdir=/var/lib/docker/overlay2/24a3f209806ab63891523111392c47ab9dbe6520ce22234cc6d7b1e49d2ce0fe/diff,workdir=/var/lib/docker/overlay2/24a3f209806ab63891523111392c47ab9dbe6520ce22234cc6d7b1e49d2ce0fe/work,nouserxattr)
overlay on /var/lib/docker/overlay2/7e00853d2d129d9e41dbf5abd2358fb2d8325b62000ea88ba01a344d7fd61e88/merged type overlay (rw,relatime,lowerdir=/var/lib/docker/overlay2/l/54CYOQU3ZQX6NNIRDHHHSJEXH3:/var/lib/docker/overlay2/l/IO32YKMAHEDY4LVRCHWQXBJU7B:/var/lib/docker/overlay2/l/W3QHXJEZN3URSXA7NWIILPNZY2:/var/lib/docker/overlay2/l/UGQ65NEHYXEBDA5DCSXOQNN5KF:/var/lib/docker/overlay2/l/R6FVQVXRQGCSCFP66SRU2RVAFV:/var/lib/docker/overlay2/l/2JVLLFUKYPDZDAQYVRGJVZAMDD:/var/lib/docker/overlay2/l/NEVXQBKXPSAH5BVPY7QHQC427M:/var/lib/docker/overlay2/l/NOQEL6RFHGW2LAAMCNIMOITJVX:/var/lib/docker/overlay2/l/ZYGPFRGLT2DDCWYGDNPGDMYYMQ,upperdir=/var/lib/docker/overlay2/7e00853d2d129d9e41dbf5abd2358fb2d8325b62000ea88ba01a344d7fd61e88/diff,workdir=/var/lib/docker/overlay2/7e00853d2d129d9e41dbf5abd2358fb2d8325b62000ea88ba01a344d7fd61e88/work,nouserxattr)
overlay on /var/lib/docker/overlay2/5f8fb40397e598912de8eb679610c8155651a7eab13cee57bc98755ff5b45c32/merged type overlay (rw,relatime,lowerdir=/var/lib/docker/overlay2/l/SJQ32BFRKMA52XRZVI4YTYUGPR:/var/lib/docker/overlay2/l/CA6O56LRINTEA3YBLVTFFFNJMK:/var/lib/docker/overlay2/l/YOYTVKQRREB6GZXROZKA2OCIOP:/var/lib/docker/overlay2/l/UQUGRLKR45IC555YHPM65M6EPT:/var/lib/docker/overlay2/l/IURT3QFNZFAKZAVANSPBCSA6F7:/var/lib/docker/overlay2/l/KCLAMG2A5YF7OYMPMDMZA6T3RJ:/var/lib/docker/overlay2/l/FENVAR7EXVRQAHA3Z5BWS4CZ56:/var/lib/docker/overlay2/l/LJ6SGLDS4U7T5UBQVANL4Q5MK3:/var/lib/docker/overlay2/l/PMG3CT6XGG5Z25DOQHE5XMR3A2:/var/lib/docker/overlay2/l/OY5AD7AXYV6XGMRV3XLSM4MRY3:/var/lib/docker/overlay2/l/D4EJTRCOG63UQT4WPVYZO6VM33:/var/lib/docker/overlay2/l/HYWHDG334X74SLQCNSOILVRXXS:/var/lib/docker/overlay2/l/7PLSBQBMCDKYZ2XJPKDEQWUFWE:/var/lib/docker/overlay2/l/A2TVIQ7C6GLAL4CJ3HMV27BDEM:/var/lib/docker/overlay2/l/ATLLBSUWG6RDKSTVZUO2HZIYVC:/var/lib/docker/overlay2/l/AKVEP6YGVQ7G6ACE3PRTIYBR3C:/var/lib/docker/overlay2/l/DG3JHBJW7F3F3ATP62KN7DLOV5:/var/lib/docker/overlay2/l/7KKAFN55HIKKQK5A6POTQ2EA63:/var/lib/docker/overlay2/l/NFERU5RHJH74ZBQECEOMWIYLNT:/var/lib/docker/overlay2/l/5F3POX2ADRHF66AYIFKAMY4KNI:/var/lib/docker/overlay2/l/FWRQEJDE3XEC2AW3CDS5AC3HQD:/var/lib/docker/overlay2/l/PJTDW6XAXYXO2GSRUP7DTANU62:/var/lib/docker/overlay2/l/HKN2SF7V6QINH3P7FE5D4BWKXG:/var/lib/docker/overlay2/l/QTMLZVTI6IEAYY6CA2CUY7JB6U,upperdir=/var/lib/docker/overlay2/5f8fb40397e598912de8eb679610c8155651a7eab13cee57bc98755ff5b45c32/diff,workdir=/var/lib/docker/overlay2/5f8fb40397e598912de8eb679610c8155651a7eab13cee57bc98755ff5b45c32/work,nouserxattr)
nsfs on /run/docker/netns/ef8e18dad7e9 type nsfs (rw)
nsfs on /run/docker/netns/67a7f27893e9 type nsfs (rw)
nsfs on /run/docker/netns/283d3b324f53 type nsfs (rw)
nsfs on /run/docker/netns/dc12615bef52 type nsfs (rw)
tmpfs on /run/user/1000 type tmpfs (rw,nosuid,nodev,relatime,size=4920588k,nr_inodes=1230147,mode=700,uid=1000,gid=1000,inode64)
tracefs on /sys/kernel/debug/tracing type tracefs (rw,nosuid,nodev,noexec,relatime)
nsfs on /run/docker/netns/default type nsfs (rw)
overlay on /var/lib/docker/overlay2/f365f677a4b16be7e6c4c75e292c33185047013ae6b52fcba4373bd777383ded/merged type overlay (rw,relatime,lowerdir=/var/lib/docker/overlay2/l/3B6N7JHPVXQ4OQVU233Q2TATFJ:/var/lib/docker/overlay2/l/LNOVNOGUQDDHYF4DHO6SICU2AI:/var/lib/docker/overlay2/l/VDIN7UZQDINXHLK4WDVEGPGZ7Q:/var/lib/docker/overlay2/l/7TKECLSNKX4LB4Y3J43HDZ42LW:/var/lib/docker/overlay2/l/RMNBGA6JZJVBEF3YRHVCEO4V6N:/var/lib/docker/overlay2/l/SLOCSX4TGS6OH7ENDXY3MY46H6:/var/lib/docker/overlay2/l/MW6F2V5CHMIJDKF57REMJLEWEK:/var/lib/docker/overlay2/l/JZ2XWLUXHW5Y23STZ2W3BKBQOT:/var/lib/docker/overlay2/l/3ZSKQMQZ4TZLVWL2TMIZ7VKZS4:/var/lib/docker/overlay2/l/VB4OMHXKNIPG4BNNVVJ7CHCZR7:/var/lib/docker/overlay2/l/SNDBFX64L3KHDLPTKDV6IYMROC:/var/lib/docker/overlay2/l/UQVRY5I2NFDYHOGSRUZLIKLQ76:/var/lib/docker/overlay2/l/BVCCHFSI2TUYI3ZMAMHXIATVFX:/var/lib/docker/overlay2/l/5MGC6CBZEFSYNIL5T2EQPMQEXM:/var/lib/docker/overlay2/l/3OQT5IIW4DI2KFU7YK53GGVRDI,upperdir=/var/lib/docker/overlay2/f365f677a4b16be7e6c4c75e292c33185047013ae6b52fcba4373bd777383ded/diff,workdir=/var/lib/docker/overlay2/f365f677a4b16be7e6c4c75e292c33185047013ae6b52fcba4373bd777383ded/work,nouserxattr)
nsfs on /run/docker/netns/4398bf6844b9 type nsfs (rw)
overlay on /var/lib/docker/overlay2/fafb72caa4a9a75ca069ed353cc024cf4a5b5c40be9a6de8b24a4bb4c52666c9/merged type overlay (rw,relatime,lowerdir=/var/lib/docker/overlay2/l/UKDTKTD7PNKAZHJ5T7U7GMZB6X:/var/lib/docker/overlay2/l/NMVQ32R6IC4MJRTEPE6IY7PGVY:/var/lib/docker/overlay2/l/7PMNYO33MZGX4KATL27D24RNQC:/var/lib/docker/overlay2/l/UWL6JYLYU6OWSOHA7J3ED2AUHY:/var/lib/docker/overlay2/l/B5TVF6F4LPOUL2T2YG45Q2VRZV:/var/lib/docker/overlay2/l/H4K5ALYTJJXI6VEQ6GS3LVN4OH:/var/lib/docker/overlay2/l/KZWRIWEOMQLJIG3AC3I6K7Y6IO:/var/lib/docker/overlay2/l/BDYSKS4774TLLUEWJEDPN5SJPV:/var/lib/docker/overlay2/l/KYXY2XMC3S6TV6KCDAO6DW4JZJ:/var/lib/docker/overlay2/l/PIJ3BSUXHJPDJDW5SAKLCZUIZH,upperdir=/var/lib/docker/overlay2/fafb72caa4a9a75ca069ed353cc024cf4a5b5c40be9a6de8b24a4bb4c52666c9/diff,workdir=/var/lib/docker/overlay2/fafb72caa4a9a75ca069ed353cc024cf4a5b5c40be9a6de8b24a4bb4c52666c9/work,nouserxattr)
nsfs on /run/docker/netns/b7db55ea957c type nsfs (rw)
overlay on /var/lib/docker/overlay2/f62d744a695615852b3fd25634dd6de0e145ddad0bfe6b408e3e104880827ee9/merged type overlay (rw,relatime,lowerdir=/var/lib/docker/overlay2/l/F4JZC6GZYT52TVEYGUDPC3UU7B:/var/lib/docker/overlay2/l/E5DZPKDZ5JUQVDRVROKN7ZPX7M:/var/lib/docker/overlay2/l/QRNGPGS5LK6Q35XUZQQSNDW4EN:/var/lib/docker/overlay2/l/LBL6FBX3ICXKS2SHEB7NZ2XFFC:/var/lib/docker/overlay2/l/REZ4J73FMU63DMF4FM67IXYCOW:/var/lib/docker/overlay2/l/WHKZC4CDTFHYKAS3XNM275F2X3:/var/lib/docker/overlay2/l/CFVNPJR5ZQZW3SYYPY5TANCQUW:/var/lib/docker/overlay2/l/TEQXB4HFOACNCFBAASU6XFTXE5:/var/lib/docker/overlay2/l/YCO73JZ5ELC44MF2XIVY6BCPSM:/var/lib/docker/overlay2/l/UJ6VNQ6G4ASACFYWSPQAVOPJOR:/var/lib/docker/overlay2/l/6MMUVEIGZSLMCZU6KO4RIZYXO7:/var/lib/docker/overlay2/l/C6BFIIRPTWLMUYWHQ2OXP5P2F7:/var/lib/docker/overlay2/l/PBARCUSGU2HCLNWT4DU4L5OSFC:/var/lib/docker/overlay2/l/2SOLRAVZWRQH4CDLLJV34JC5GF:/var/lib/docker/overlay2/l/UYPYPFCKFQ3T5FGNXBV4TDJEAO:/var/lib/docker/overlay2/l/WBVUEDDW5IGZ65HG3GQ5M45BW7,upperdir=/var/lib/docker/overlay2/f62d744a695615852b3fd25634dd6de0e145ddad0bfe6b408e3e104880827ee9/diff,workdir=/var/lib/docker/overlay2/f62d744a695615852b3fd25634dd6de0e145ddad0bfe6b408e3e104880827ee9/work,nouserxattr)


## RAID / mdadm

$ cat /proc/mdstat; echo; mdadm --detail /dev/md0 2>/dev/null | sed -n '1,260p' || true
Personalities : [raid6] [raid5] [raid4] [raid0] [raid1] [raid10] 
md0 : active raid5 sda[0] sdc[3] sdb[1]
      1875120128 blocks super 1.2 level 5, 512k chunk, algorithm 2 [3/3] [UUU]
      bitmap: 0/7 pages [0KB], 65536KB chunk

unused devices: <none>

/dev/md0:
           Version : 1.2
     Creation Time : Wed Sep  3 00:08:45 2025
        Raid Level : raid5
        Array Size : 1875120128 (1788.25 GiB 1920.12 GB)
     Used Dev Size : 937560064 (894.13 GiB 960.06 GB)
      Raid Devices : 3
     Total Devices : 3
       Persistence : Superblock is persistent

     Intent Bitmap : Internal

       Update Time : Mon Dec 15 17:31:02 2025
             State : clean 
    Active Devices : 3
   Working Devices : 3
    Failed Devices : 0
     Spare Devices : 0

            Layout : left-symmetric
        Chunk Size : 512K

Consistency Policy : bitmap

              Name : jkg-server:0
              UUID : 089a8037:005ded1a:3915156e:79ed324f
            Events : 1374

    Number   Major   Minor   RaidDevice State
       0       8        0        0      active sync   /dev/sda
       1       8       16        1      active sync   /dev/sdb
       3       8       32        2      active sync   /dev/sdc


## SMART (resumen)

$ for d in /dev/sd[a-z] /dev/nvme*n1; do [ -b "$d" ] || continue; echo "== $d =="; smartctl -H "$d" 2>/dev/null || true; done
== /dev/sda ==
smartctl 7.4 2023-08-01 r5530 [x86_64-linux-6.8.0-90-generic] (local build)
Copyright (C) 2002-23, Bruce Allen, Christian Franke, www.smartmontools.org

=== START OF READ SMART DATA SECTION ===
SMART overall-health self-assessment test result: PASSED

== /dev/sdb ==
smartctl 7.4 2023-08-01 r5530 [x86_64-linux-6.8.0-90-generic] (local build)
Copyright (C) 2002-23, Bruce Allen, Christian Franke, www.smartmontools.org

=== START OF READ SMART DATA SECTION ===
SMART overall-health self-assessment test result: PASSED

== /dev/sdc ==
smartctl 7.4 2023-08-01 r5530 [x86_64-linux-6.8.0-90-generic] (local build)
Copyright (C) 2002-23, Bruce Allen, Christian Franke, www.smartmontools.org

=== START OF READ SMART DATA SECTION ===
SMART overall-health self-assessment test result: PASSED

== /dev/nvme0n1 ==
smartctl 7.4 2023-08-01 r5530 [x86_64-linux-6.8.0-90-generic] (local build)
Copyright (C) 2002-23, Bruce Allen, Christian Franke, www.smartmontools.org

=== START OF SMART DATA SECTION ===
SMART overall-health self-assessment test result: PASSED



## Red / rutas / DNS

$ ip -br a; echo; ip r; echo; resolvectl status 2>/dev/null | sed -n '1,260p' || cat /etc/resolv.conf
lo               UNKNOWN        127.0.0.1/8 ::1/128 
eno1             UP             [IP-REDACTED]/24 fd87:7b42:69e:0:725a:fff:fe4a:bc13/64 fe80::725a:fff:fe4a:bc13/64 
tailscale0       UNKNOWN        [IP-REDACTED]/32 fd7a:115c:a1e0::3401:ba86/128 fe80::4f74:f585:382b:923a/64 
br-b1dc2e5340d9  DOWN           [IP-REDACTED]/16 
br-ce54daa5efd6  UP             [IP-REDACTED]/16 fe80::4dd:f9ff:fe9c:bb9f/64 
docker0          UP             [IP-REDACTED]/16 fe80::9458:efff:fef8:2dcc/64 
br-7b03fbe48be0  DOWN           [IP-REDACTED]/16 
vethd2bda24@if2  UP             fe80::e8ff:11ff:fe32:98af/64 
vethcdd5552@if2  UP             fe80::b025:66ff:fe29:eb91/64 
veth2625466@if2  UP             fe80::a493:d8ff:fe9d:5db0/64 
veth3d2a5db@if2  UP             fe80::c418:78ff:fea2:81d7/64 
br-799851584ab4  UP             [IP-REDACTED]/16 fe80::501f:afff:feea:c47d/64 
vethf9e3f25@if2  UP             fe80::b0c0:faff:fe6c:9fd3/64 
veth6fd7b58@if2  UP             fe80::b8bd:4dff:fe1c:8b94/64 

default via [IP-REDACTED] dev eno1 proto static 
[IP-REDACTED]/16 dev docker0 proto kernel scope link src [IP-REDACTED] 
[IP-REDACTED]/16 dev br-b1dc2e5340d9 proto kernel scope link src [IP-REDACTED] linkdown 
[IP-REDACTED]/16 dev br-7b03fbe48be0 proto kernel scope link src [IP-REDACTED] linkdown 
[IP-REDACTED]/16 dev br-ce54daa5efd6 proto kernel scope link src [IP-REDACTED] 
[IP-REDACTED]/16 dev br-799851584ab4 proto kernel scope link src [IP-REDACTED] 
[IP-REDACTED]/24 dev eno1 proto kernel scope link src [IP-REDACTED] 

Global
           Protocols: -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported
    resolv.conf mode: stub
  Current DNS Server: 1.1.1.1
         DNS Servers: 1.1.1.1 1.0.0.1 127.0.0.1
Fallback DNS Servers: 8.8.8.8 9.9.9.9 1.1.1.1 1.0.0.1

Link 2 (eno1)
    Current Scopes: DNS
         Protocols: +DefaultRoute -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported
Current DNS Server: 1.1.1.1
       DNS Servers: 1.1.1.1 1.0.0.1 8.8.8.8 8.8.4.4

Link 3 (tailscale0)
    Current Scopes: DNS
         Protocols: -DefaultRoute -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported
Current DNS Server: [IP-REDACTED]
       DNS Servers: [IP-REDACTED]
        DNS Domain: tail4a3829.ts.net ~0.e.1.a.c.5.1.1.a.7.d.f.ip6.arpa
                    ~100.100.in-addr.arpa ~101.100.in-addr.arpa
                    ~102.100.in-addr.arpa ~103.100.in-addr.arpa
                    ~104.100.in-addr.arpa ~105.100.in-addr.arpa
                    ~106.100.in-addr.arpa ~107.100.in-addr.arpa
                    ~108.100.in-addr.arpa ~109.100.in-addr.arpa
                    ~110.100.in-addr.arpa ~111.100.in-addr.arpa
                    ~112.100.in-addr.arpa ~113.100.in-addr.arpa
                    ~114.100.in-addr.arpa ~115.100.in-addr.arpa
                    ~116.100.in-addr.arpa ~117.100.in-addr.arpa
                    ~118.100.in-addr.arpa ~119.100.in-addr.arpa
                    ~120.100.in-addr.arpa ~121.100.in-addr.arpa
                    ~122.100.in-addr.arpa ~123.100.in-addr.arpa
                    ~124.100.in-addr.arpa ~125.100.in-addr.arpa
                    ~126.100.in-addr.arpa ~127.100.in-addr.arpa
                    ~64.100.in-addr.arpa ~65.100.in-addr.arpa
                    ~66.100.in-addr.arpa ~67.100.in-addr.arpa
                    ~68.100.in-addr.arpa ~69.100.in-addr.arpa
                    ~70.100.in-addr.arpa ~71.100.in-addr.arpa
                    ~72.100.in-addr.arpa ~73.100.in-addr.arpa
                    ~74.100.in-addr.arpa ~75.100.in-addr.arpa
                    ~76.100.in-addr.arpa ~77.100.in-addr.arpa
                    ~78.100.in-addr.arpa ~79.100.in-addr.arpa
                    ~80.100.in-addr.arpa ~81.100.in-addr.arpa
                    ~82.100.in-addr.arpa ~83.100.in-addr.arpa
                    ~84.100.in-addr.arpa ~85.100.in-addr.arpa
                    ~86.100.in-addr.arpa ~87.100.in-addr.arpa
                    ~88.100.in-addr.arpa ~89.100.in-addr.arpa
                    ~90.100.in-addr.arpa ~91.100.in-addr.arpa
                    ~92.100.in-addr.arpa ~93.100.in-addr.arpa
                    ~94.100.in-addr.arpa ~95.100.in-addr.arpa
                    ~96.100.in-addr.arpa ~97.100.in-addr.arpa
                    ~98.100.in-addr.arpa ~99.100.in-addr.arpa ~ts.net

Link 4 (br-b1dc2e5340d9)
    Current Scopes: none
         Protocols: -DefaultRoute -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported

Link 5 (br-ce54daa5efd6)
    Current Scopes: none
         Protocols: -DefaultRoute -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported

Link 7 (docker0)
    Current Scopes: none
         Protocols: -DefaultRoute -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported

Link 8 (br-7b03fbe48be0)
    Current Scopes: none
         Protocols: -DefaultRoute -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported

Link 10 (vethd2bda24)
    Current Scopes: none
         Protocols: -DefaultRoute -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported

Link 12 (vethcdd5552)
    Current Scopes: none
         Protocols: -DefaultRoute -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported

Link 13 (veth2625466)
    Current Scopes: none
         Protocols: -DefaultRoute -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported

Link 14 (veth3d2a5db)
    Current Scopes: none
         Protocols: -DefaultRoute -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported

Link 36 (br-799851584ab4)
    Current Scopes: none
         Protocols: -DefaultRoute -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported

Link 37 (vethf9e3f25)
    Current Scopes: none
         Protocols: -DefaultRoute -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported

Link 38 (veth6fd7b58)
    Current Scopes: none
         Protocols: -DefaultRoute -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported


## Puertos escuchando

$ ss -lntup 2>/dev/null | sed -n '1,260p' || true
Netid State  Recv-Q Send-Q                        Local Address:Port  Peer Address:PortProcess                                                                                                                                   
udp   UNCONN 0      0                             [IP-REDACTED]:3702       0.0.0.0:*    users:(("python3",pid=1639,fd=9))                                                                                                        
udp   UNCONN 0      0                           239.255.255.250:3702       0.0.0.0:*    users:(("python3",pid=1639,fd=7))                                                                                                        
udp   UNCONN 0      0                                   0.0.0.0:5353       0.0.0.0:*    users:(("avahi-daemon",pid=862,fd=12))                                                                                                   
udp   UNCONN 0      0                                   0.0.0.0:41641      0.0.0.0:*    users:(("tailscaled",pid=1145,fd=18))                                                                                                    
udp   UNCONN 0      0                                   0.0.0.0:10000      0.0.0.0:*    users:(("perl",pid=13476,fd=7))                                                                                                          
udp   UNCONN 0      0                                   0.0.0.0:55970      0.0.0.0:*    users:(("avahi-daemon",pid=862,fd=14))                                                                                                   
udp   UNCONN 0      0                                   0.0.0.0:56996      0.0.0.0:*    users:(("python3",pid=1639,fd=8))                                                                                                        
udp   UNCONN 0      0                                 127.0.0.1:53         0.0.0.0:*    users:(("dnsmasq",pid=551836,fd=6))                                                                                                      
udp   UNCONN 0      0                             [IP-REDACTED]:53         0.0.0.0:*    users:(("dnsmasq",pid=551836,fd=4))                                                                                                      
udp   UNCONN 0      0                                127.0.0.54:53         0.0.0.0:*    users:(("systemd-resolve",pid=387236,fd=16))                                                                                             
udp   UNCONN 0      0                             127.0.0.53%lo:53         0.0.0.0:*    users:(("systemd-resolve",pid=387236,fd=14))                                                                                             
udp   UNCONN 0      0                            [IP-REDACTED]:137        0.0.0.0:*    users:(("nmbd",pid=1375,fd=42))                                                                                                          
udp   UNCONN 0      0                                [IP-REDACTED]:137        0.0.0.0:*    users:(("nmbd",pid=1375,fd=41))                                                                                                          
udp   UNCONN 0      0                            [IP-REDACTED]:137        0.0.0.0:*    users:(("nmbd",pid=1375,fd=38))                                                                                                          
udp   UNCONN 0      0                                [IP-REDACTED]:137        0.0.0.0:*    users:(("nmbd",pid=1375,fd=37))                                                                                                          
udp   UNCONN 0      0                            [IP-REDACTED]:137        0.0.0.0:*    users:(("nmbd",pid=1375,fd=34))                                                                                                          
udp   UNCONN 0      0                                [IP-REDACTED]:137        0.0.0.0:*    users:(("nmbd",pid=1375,fd=33))                                                                                                          
udp   UNCONN 0      0                            [IP-REDACTED]:137        0.0.0.0:*    users:(("nmbd",pid=1375,fd=30))                                                                                                          
udp   UNCONN 0      0                                [IP-REDACTED]:137        0.0.0.0:*    users:(("nmbd",pid=1375,fd=29))                                                                                                          
udp   UNCONN 0      0                            [IP-REDACTED]:137        0.0.0.0:*    users:(("nmbd",pid=1375,fd=26))                                                                                                          
udp   UNCONN 0      0                                [IP-REDACTED]:137        0.0.0.0:*    users:(("nmbd",pid=1375,fd=25))                                                                                                          
udp   UNCONN 0      0                             [IP-REDACTED]:137        0.0.0.0:*    users:(("nmbd",pid=1375,fd=19))                                                                                                          
udp   UNCONN 0      0                             [IP-REDACTED]:137        0.0.0.0:*    users:(("nmbd",pid=1375,fd=18))                                                                                                          
udp   UNCONN 0      0                                   0.0.0.0:137        0.0.0.0:*    users:(("nmbd",pid=1375,fd=16))                                                                                                          
udp   UNCONN 0      0                            [IP-REDACTED]:138        0.0.0.0:*    users:(("nmbd",pid=1375,fd=44))                                                                                                          
udp   UNCONN 0      0                                [IP-REDACTED]:138        0.0.0.0:*    users:(("nmbd",pid=1375,fd=43))                                                                                                          
udp   UNCONN 0      0                            [IP-REDACTED]:138        0.0.0.0:*    users:(("nmbd",pid=1375,fd=40))                                                                                                          
udp   UNCONN 0      0                                [IP-REDACTED]:138        0.0.0.0:*    users:(("nmbd",pid=1375,fd=39))                                                                                                          
udp   UNCONN 0      0                            [IP-REDACTED]:138        0.0.0.0:*    users:(("nmbd",pid=1375,fd=36))                                                                                                          
udp   UNCONN 0      0                                [IP-REDACTED]:138        0.0.0.0:*    users:(("nmbd",pid=1375,fd=35))                                                                                                          
udp   UNCONN 0      0                            [IP-REDACTED]:138        0.0.0.0:*    users:(("nmbd",pid=1375,fd=32))                                                                                                          
udp   UNCONN 0      0                                [IP-REDACTED]:138        0.0.0.0:*    users:(("nmbd",pid=1375,fd=31))                                                                                                          
udp   UNCONN 0      0                            [IP-REDACTED]:138        0.0.0.0:*    users:(("nmbd",pid=1375,fd=28))                                                                                                          
udp   UNCONN 0      0                                [IP-REDACTED]:138        0.0.0.0:*    users:(("nmbd",pid=1375,fd=27))                                                                                                          
udp   UNCONN 0      0                             [IP-REDACTED]:138        0.0.0.0:*    users:(("nmbd",pid=1375,fd=21))                                                                                                          
udp   UNCONN 0      0                             [IP-REDACTED]:138        0.0.0.0:*    users:(("nmbd",pid=1375,fd=20))                                                                                                          
udp   UNCONN 0      0                                   0.0.0.0:138        0.0.0.0:*    users:(("nmbd",pid=1375,fd=17))                                                                                                          
udp   UNCONN 0      0           [fe80::725a:fff:fe4a:bc13]%eno1:3702          [::]:*    users:(("python3",pid=1639,fd=13))                                                                                                       
udp   UNCONN 0      0                            [ff02::c]%eno1:3702          [::]:*    users:(("python3",pid=1639,fd=11))                                                                                                       
udp   UNCONN 0      0                                      [::]:5353          [::]:*    users:(("avahi-daemon",pid=862,fd=13))                                                                                                   
udp   UNCONN 0      0                                      [::]:41641         [::]:*    users:(("tailscaled",pid=1145,fd=17))                                                                                                    
udp   UNCONN 0      0                                      [::]:50532         [::]:*    users:(("avahi-daemon",pid=862,fd=15))                                                                                                   
udp   UNCONN 0      0                                         *:51442            *:*    users:(("python3",pid=1639,fd=12))                                                                                                       
udp   UNCONN 0      0                                     [::1]:53            [::]:*    users:(("dnsmasq",pid=551836,fd=12))                                                                                                     
udp   UNCONN 0      0      [fd87:7b42:69e:0:725a:fff:fe4a:bc13]:53            [::]:*    users:(("dnsmasq",pid=551836,fd=10))                                                                                                     
udp   UNCONN 0      0           [fe80::725a:fff:fe4a:bc13]%eno1:53            [::]:*    users:(("dnsmasq",pid=551836,fd=8))                                                                                                      
tcp   LISTEN 0      5                                   0.0.0.0:44321      0.0.0.0:*    users:(("pmcd",pid=1396,fd=0))                                                                                                           
tcp   LISTEN 0      128                                 0.0.0.0:44323      0.0.0.0:*    users:(("pmproxy",pid=1424,fd=15))                                                                                                       
tcp   LISTEN 0      128                                 0.0.0.0:44322      0.0.0.0:*    users:(("pmproxy",pid=1424,fd=13))                                                                                                       
tcp   LISTEN 0      4096                                0.0.0.0:9443       0.0.0.0:*    users:(("docker-proxy",pid=3463,fd=7))                                                                                                   
tcp   LISTEN 0      4096                             127.0.0.54:53         0.0.0.0:*    users:(("systemd-resolve",pid=387236,fd=17))                                                                                             
tcp   LISTEN 0      4096                                0.0.0.0:10000      0.0.0.0:*    users:(("perl",pid=13476,fd=5))                                                                                                          
tcp   LISTEN 0      4096                        [IP-REDACTED]:50363      0.0.0.0:*    users:(("tailscaled",pid=1145,fd=26))                                                                                                    
tcp   LISTEN 0      4096                          127.0.0.53%lo:53         0.0.0.0:*    users:(("systemd-resolve",pid=387236,fd=15))                                                                                             
tcp   LISTEN 0      32                            [IP-REDACTED]:53         0.0.0.0:*    users:(("dnsmasq",pid=551836,fd=5))                                                                                                      
tcp   LISTEN 0      511                                 0.0.0.0:80         0.0.0.0:*    users:(("nginx",pid=828997,fd=5),("nginx",pid=828996,fd=5),("nginx",pid=828995,fd=5),("nginx",pid=828994,fd=5),("nginx",pid=828993,fd=5))
tcp   LISTEN 0      4096                                0.0.0.0:22         0.0.0.0:*    users:(("sshd",pid=1315,fd=3),("systemd",pid=1,fd=151))                                                                                  
tcp   LISTEN 0      50                                  0.0.0.0:139        0.0.0.0:*    users:(("smbd",pid=1436,fd=32))                                                                                                          
tcp   LISTEN 0      50                                  0.0.0.0:445        0.0.0.0:*    users:(("smbd",pid=1436,fd=31))                                                                                                          
tcp   LISTEN 0      511                                 0.0.0.0:443        0.0.0.0:*    users:(("nginx",pid=828997,fd=7),("nginx",pid=828996,fd=7),("nginx",pid=828995,fd=7),("nginx",pid=828994,fd=7),("nginx",pid=828993,fd=7))
tcp   LISTEN 0      4096                                0.0.0.0:8000       0.0.0.0:*    users:(("docker-proxy",pid=3411,fd=7))                                                                                                   
tcp   LISTEN 0      4096                                0.0.0.0:8082       0.0.0.0:*    users:(("docker-proxy",pid=3354,fd=7))                                                                                                   
tcp   LISTEN 0      5                                   0.0.0.0:4330       0.0.0.0:*    users:(("pmlogger",pid=2060,fd=7))                                                                                                       
tcp   LISTEN 0      5                             [IP-REDACTED]:5357       0.0.0.0:*    users:(("python3",pid=1639,fd=10))                                                                                                       
tcp   LISTEN 0      5                                 127.0.0.1:555        0.0.0.0:*    users:(("stats.pl",pid=853902,fd=3))                                                                                                     
tcp   LISTEN 0      32                                127.0.0.1:53         0.0.0.0:*    users:(("dnsmasq",pid=551836,fd=7))                                                                                                      
tcp   LISTEN 0      4096                              127.0.0.1:8069       0.0.0.0:*    users:(("docker-proxy",pid=244438,fd=7))                                                                                                 
tcp   LISTEN 0      4096                              127.0.0.1:8072       0.0.0.0:*    users:(("docker-proxy",pid=244455,fd=7))                                                                                                 
tcp   LISTEN 0      5                                      [::]:44321         [::]:*    users:(("pmcd",pid=1396,fd=3))                                                                                                           
tcp   LISTEN 0      128                                    [::]:44323         [::]:*    users:(("pmproxy",pid=1424,fd=16))                                                                                                       
tcp   LISTEN 0      128                                    [::]:44322         [::]:*    users:(("pmproxy",pid=1424,fd=14))                                                                                                       
tcp   LISTEN 0      4096                                   [::]:9443          [::]:*    users:(("docker-proxy",pid=3471,fd=7))                                                                                                   
tcp   LISTEN 0      4096                                   [::]:10000         [::]:*    users:(("perl",pid=13476,fd=6))                                                                                                          
tcp   LISTEN 0      4096                                      *:9090             *:*    users:(("cockpit-tls",pid=852818,fd=3),("systemd",pid=1,fd=351))                                                                         
tcp   LISTEN 0      511                                    [::]:80            [::]:*    users:(("nginx",pid=828997,fd=6),("nginx",pid=828996,fd=6),("nginx",pid=828995,fd=6),("nginx",pid=828994,fd=6),("nginx",pid=828993,fd=6))
tcp   LISTEN 0      4096                                   [::]:22            [::]:*    users:(("sshd",pid=1315,fd=4),("systemd",pid=1,fd=155))                                                                                  
tcp   LISTEN 0      50                                     [::]:139           [::]:*    users:(("smbd",pid=1436,fd=30))                                                                                                          
tcp   LISTEN 0      50                                     [::]:445           [::]:*    users:(("smbd",pid=1436,fd=29))                                                                                                          
tcp   LISTEN 0      511                                    [::]:443           [::]:*    users:(("nginx",pid=828997,fd=8),("nginx",pid=828996,fd=8),("nginx",pid=828995,fd=8),("nginx",pid=828994,fd=8),("nginx",pid=828993,fd=8))
tcp   LISTEN 0      4096                                   [::]:8000          [::]:*    users:(("docker-proxy",pid=3419,fd=7))                                                                                                   
tcp   LISTEN 0      4096                                   [::]:8082          [::]:*    users:(("docker-proxy",pid=3367,fd=7))                                                                                                   
tcp   LISTEN 0      32                                    [::1]:53            [::]:*    users:(("dnsmasq",pid=551836,fd=13))                                                                                                     
tcp   LISTEN 0      5                                      [::]:4330          [::]:*    users:(("pmlogger",pid=2060,fd=8))                                                                                                       
tcp   LISTEN 0      32     [fd87:7b42:69e:0:725a:fff:fe4a:bc13]:53            [::]:*    users:(("dnsmasq",pid=551836,fd=11))                                                                                                     
tcp   LISTEN 0      4096            [fd7a:115c:a1e0::3401:ba86]:54018         [::]:*    users:(("tailscaled",pid=1145,fd=27))                                                                                                    
tcp   LISTEN 0      4096                                      *:20241            *:*    users:(("cloudflared",pid=370731,fd=3))                                                                                                  
tcp   LISTEN 0      5           [fe80::725a:fff:fe4a:bc13]%eno1:5357          [::]:*    users:(("python3",pid=1639,fd=14))                                                                                                       
tcp   LISTEN 0      32          [fe80::725a:fff:fe4a:bc13]%eno1:53            [::]:*    users:(("dnsmasq",pid=551836,fd=9))                                                                                                      


## Systemd (fallos + timers)

$ systemctl --failed --no-pager -l || true; echo; systemctl list-timers --all --no-pager | sed -n '1,260p' || true
  UNIT                        LOAD      ACTIVE SUB    DESCRIPTION
● jkg-cf-dns-override.service not-found failed failed jkg-cf-dns-override.service
● jkg-odoo-compliance.service loaded    failed failed JKG - Auditor Compliance Odoo (Veri*Factu) [LocalDB]
● unbound-resolvconf.service  not-found failed failed unbound-resolvconf.service
● unbound.service             not-found failed failed unbound.service

Legend: LOAD   → Reflects whether the unit definition was properly loaded.
        ACTIVE → The high-level unit activation state, i.e. generalization of SUB.
        SUB    → The low-level unit activation state, values depend on unit type.

4 loaded units listed.

NEXT                                  LEFT LAST                               PASSED UNIT                           ACTIVATES
Mon 2025-12-15 17:54:52 CET             1s Mon 2025-12-15 17:54:22 CET       28s ago jkg-edge-watchdog.timer        jkg-edge-watchdog.service
Mon 2025-12-15 17:55:00 CET             9s Mon 2025-12-15 17:25:01 CET     29min ago pmlogger_check.timer           pmlogger_check.service
Mon 2025-12-15 17:55:10 CET            19s Mon 2025-12-15 17:25:11 CET     29min ago pmlogger_farm_check.timer      pmlogger_farm_check.service
Mon 2025-12-15 17:55:16 CET            25s Mon 2025-12-15 17:54:16 CET       34s ago jkg-cf-failover-check.timer    jkg-cf-failover-check.service
Mon 2025-12-15 17:58:00 CET        3min 9s Mon 2025-12-15 17:28:04 CET     26min ago pmie_check.timer               pmie_check.service
Mon 2025-12-15 17:58:10 CET       3min 19s Mon 2025-12-15 17:28:12 CET     26min ago pmie_farm_check.timer          pmie_farm_check.service
Mon 2025-12-15 18:00:00 CET           5min Mon 2025-12-15 17:50:00 CET  4min 50s ago sysstat-collect.timer          sysstat-collect.service
Mon 2025-12-15 18:30:24 CET          35min Mon 2025-12-15 17:41:16 CET     13min ago fwupd-refresh.timer            fwupd-refresh.service
Mon 2025-12-15 22:13:48 CET       4h 18min Mon 2025-12-15 08:27:40 CET        9h ago apt-daily.timer                apt-daily.service
Tue 2025-12-16 00:00:00 CET             6h Mon 2025-12-15 00:00:00 CET       17h ago dpkg-db-backup.timer           dpkg-db-backup.service
Tue 2025-12-16 00:00:00 CET             6h Mon 2025-12-15 00:00:00 CET       17h ago logrotate.timer                logrotate.service
Tue 2025-12-16 00:07:00 CET             6h Mon 2025-12-15 00:07:02 CET       17h ago sysstat-summary.timer          sysstat-summary.service
Tue 2025-12-16 00:08:00 CET             6h Mon 2025-12-15 00:08:00 CET       17h ago pmie_daily.timer               pmie_daily.service
Tue 2025-12-16 00:10:00 CET             6h Mon 2025-12-15 00:10:00 CET       17h ago pmlogger_daily.timer           pmlogger_daily.service
Tue 2025-12-16 02:27:39 CET             8h Mon 2025-12-15 02:27:39 CET       15h ago update-notifier-download.timer update-notifier-download.service
Tue 2025-12-16 02:32:46 CET             8h Mon 2025-12-15 14:32:46 CET  3h 22min ago nextcloud-files-scan.timer     nextcloud-files-scan.service
Tue 2025-12-16 02:37:37 CET             8h Mon 2025-12-15 02:37:37 CET       15h ago systemd-tmpfiles-clean.timer   systemd-tmpfiles-clean.service
Tue 2025-12-16 03:15:00 CET             9h Mon 2025-12-15 03:15:00 CET       14h ago jkg-odoo-compliance.timer      jkg-odoo-compliance.service
Tue 2025-12-16 03:28:34 CET             9h Mon 2025-12-15 16:52:35 CET   1h 2min ago certbot.timer                  certbot.service
Tue 2025-12-16 04:46:00 CET            10h Mon 2025-12-15 09:55:17 CET        7h ago man-db.timer                   man-db.service
Tue 2025-12-16 06:46:38 CET            12h Mon 2025-12-15 06:51:30 CET       11h ago apt-daily-upgrade.timer        apt-daily-upgrade.service
Tue 2025-12-16 11:04:43 CET            17h Mon 2025-12-15 08:34:07 CET        9h ago mdcheck_continue.timer         mdcheck_continue.service
Tue 2025-12-16 11:37:04 CET            17h Mon 2025-12-15 16:17:54 CET  1h 36min ago motd-news.timer                motd-news.service
Tue 2025-12-16 15:14:07 CET            21h Mon 2025-12-15 12:42:13 CET  5h 12min ago mdmonitor-oneshot.timer        mdmonitor-oneshot.service
Wed 2025-12-17 22:56:28 CET         2 days Mon 2025-12-08 09:29:38 CET             - update-notifier-motd.timer     update-notifier-motd.service
Sun 2025-12-21 03:10:42 CET         5 days Sun 2025-12-14 03:10:11 CET 1 day 14h ago e2scrub_all.timer              e2scrub_all.service
Mon 2025-12-22 01:14:30 CET         6 days Mon 2025-12-15 00:48:43 CET       17h ago fstrim.timer                   fstrim.service
Sun 2026-01-04 03:55:13 CET 2 weeks 5 days Sun 2025-12-07 21:06:33 CET             - mdcheck_start.timer            mdcheck_start.service
-                                        - -                                       - apport-autoreport.timer        apport-autoreport.service
-                                        - -                                       - snapd.snap-repair.timer        snapd.snap-repair.service
-                                        - -                                       - ua-timer.timer                 ua-timer.service

31 timers listed.


## Logs críticos (último arranque)

$ journalctl -p err..alert -b --no-pager | tail -n 220 || true
dic 15 17:38:31 JKG-SERVER smbd[852598]: [2025/12/15 17:38:31.259002,  0] lib/param/loadparm.c:1957(lpcfg_do_service_parameter)
dic 15 17:38:31 JKG-SERVER smbd[852598]:   Global parameter pam password change found in service section!
dic 15 17:38:31 JKG-SERVER smbd[852598]: [2025/12/15 17:38:31.259038,  0] lib/param/loadparm.c:1957(lpcfg_do_service_parameter)
dic 15 17:38:31 JKG-SERVER smbd[852598]:   Global parameter map to guest found in service section!
dic 15 17:38:31 JKG-SERVER smbd[852598]: [2025/12/15 17:38:31.259079,  0] lib/param/loadparm.c:1957(lpcfg_do_service_parameter)
dic 15 17:38:31 JKG-SERVER smbd[852598]:   Global parameter usershare allow guests found in service section!
dic 15 17:38:31 JKG-SERVER smbd[852598]: [2025/12/15 17:38:31.269189,  0] source3/param/loadparm.c:4693(widelinks_warning)
dic 15 17:38:31 JKG-SERVER smbd[852598]:   widelinks_warning: Share 'Empresa' has wide links and SMB1 unix extensions enabled. These parameters are incompatible. Wide links will be disabled for this share.
dic 15 17:38:33 JKG-SERVER (python3)[852603]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:38:38 JKG-SERVER (python3)[852623]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:38:43 JKG-SERVER (python3)[852630]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:38:49 JKG-SERVER (python3)[852636]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:38:54 JKG-SERVER (python3)[852643]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:38:59 JKG-SERVER (python3)[852650]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:39:04 JKG-SERVER (python3)[852659]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:39:10 JKG-SERVER (python3)[852666]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:39:15 JKG-SERVER (python3)[852679]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:39:20 JKG-SERVER (python3)[852685]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:39:25 JKG-SERVER (python3)[852692]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:39:31 JKG-SERVER (python3)[852699]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:39:36 JKG-SERVER (python3)[852707]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:39:41 JKG-SERVER (python3)[852726]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:39:46 JKG-SERVER (python3)[852733]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:39:52 JKG-SERVER (python3)[852739]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:39:57 JKG-SERVER (python3)[852747]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:40:02 JKG-SERVER (python3)[852801]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:40:07 JKG-SERVER (python3)[852812]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:40:13 JKG-SERVER (python3)[852838]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:40:18 JKG-SERVER (python3)[852905]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:40:23 JKG-SERVER (python3)[852918]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:40:28 JKG-SERVER (python3)[852925]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:40:34 JKG-SERVER (python3)[853065]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:40:39 JKG-SERVER (python3)[853622]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:40:44 JKG-SERVER (python3)[853941]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:40:49 JKG-SERVER (python3)[854180]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:40:55 JKG-SERVER (python3)[854754]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:41:00 JKG-SERVER (python3)[854769]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:41:05 JKG-SERVER (python3)[854778]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:41:10 JKG-SERVER (python3)[854793]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:41:15 JKG-SERVER (python3)[855205]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:41:21 JKG-SERVER (python3)[855572]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:41:26 JKG-SERVER (python3)[855764]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:41:31 JKG-SERVER (python3)[855790]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:41:36 JKG-SERVER (python3)[856567]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:41:41 JKG-SERVER (python3)[856913]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:41:47 JKG-SERVER (python3)[856923]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:41:52 JKG-SERVER (python3)[856941]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:41:57 JKG-SERVER (python3)[856948]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:42:02 JKG-SERVER (python3)[856957]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:42:08 JKG-SERVER (python3)[856964]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:42:13 JKG-SERVER (python3)[856970]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:42:18 JKG-SERVER (python3)[856982]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:42:23 JKG-SERVER (python3)[856989]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:42:29 JKG-SERVER (python3)[857001]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:42:34 JKG-SERVER (python3)[857034]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:42:39 JKG-SERVER (python3)[857060]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:42:44 JKG-SERVER (python3)[857074]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:42:50 JKG-SERVER (python3)[857106]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:42:55 JKG-SERVER (python3)[857117]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:43:00 JKG-SERVER (python3)[857123]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:43:05 JKG-SERVER (python3)[857134]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:43:11 JKG-SERVER (python3)[857144]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:43:16 JKG-SERVER (python3)[857153]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:43:21 JKG-SERVER (python3)[857164]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:43:26 JKG-SERVER (python3)[857173]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:43:32 JKG-SERVER (python3)[857180]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:43:37 JKG-SERVER (python3)[857189]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:43:42 JKG-SERVER (python3)[857195]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:43:47 JKG-SERVER (python3)[857204]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:43:53 JKG-SERVER (python3)[857214]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:43:58 JKG-SERVER (python3)[857236]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:44:03 JKG-SERVER (python3)[857244]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:44:08 JKG-SERVER (python3)[857253]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:44:14 JKG-SERVER (python3)[857260]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:44:19 JKG-SERVER (python3)[857269]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:44:24 JKG-SERVER (python3)[857284]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:44:29 JKG-SERVER (python3)[857293]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:44:35 JKG-SERVER (python3)[857301]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:44:40 JKG-SERVER (python3)[857309]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:44:45 JKG-SERVER (python3)[857315]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:44:50 JKG-SERVER (python3)[857322]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:44:56 JKG-SERVER (python3)[857334]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:45:01 JKG-SERVER (python3)[857395]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:45:06 JKG-SERVER (python3)[857410]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:45:11 JKG-SERVER (python3)[857418]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:45:17 JKG-SERVER (python3)[857427]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:45:22 JKG-SERVER (python3)[857433]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:45:27 JKG-SERVER (python3)[857446]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:45:32 JKG-SERVER (python3)[857459]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:45:37 JKG-SERVER (python3)[857595]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:45:43 JKG-SERVER (python3)[857601]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:45:48 JKG-SERVER (python3)[857609]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:45:53 JKG-SERVER (python3)[857616]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:45:58 JKG-SERVER (python3)[857639]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:46:04 JKG-SERVER (python3)[857648]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:46:09 JKG-SERVER (python3)[857656]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:46:14 JKG-SERVER (python3)[857664]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:46:19 JKG-SERVER (python3)[857673]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:46:25 JKG-SERVER (python3)[857679]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:46:30 JKG-SERVER (python3)[857692]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:46:35 JKG-SERVER (python3)[857700]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:46:40 JKG-SERVER (python3)[857709]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:46:46 JKG-SERVER (python3)[857715]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:46:51 JKG-SERVER (python3)[857724]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:46:56 JKG-SERVER (python3)[857732]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:47:01 JKG-SERVER (python3)[857756]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:47:07 JKG-SERVER (python3)[857762]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:47:12 JKG-SERVER (python3)[857774]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:47:17 JKG-SERVER (python3)[857781]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:47:22 JKG-SERVER (python3)[857790]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:47:28 JKG-SERVER (python3)[857796]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:47:33 JKG-SERVER (python3)[857810]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:47:38 JKG-SERVER (python3)[857817]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:47:43 JKG-SERVER (python3)[857826]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:47:49 JKG-SERVER (python3)[857848]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:47:54 JKG-SERVER (python3)[857857]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:47:59 JKG-SERVER (python3)[857865]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:48:04 JKG-SERVER (python3)[857890]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:48:10 JKG-SERVER (python3)[857896]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:48:15 JKG-SERVER (python3)[857907]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:48:20 JKG-SERVER (python3)[857913]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:48:25 JKG-SERVER (python3)[857920]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:48:31 JKG-SERVER (python3)[857928]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:48:36 JKG-SERVER (python3)[857937]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:48:41 JKG-SERVER (python3)[857949]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:48:46 JKG-SERVER (python3)[857955]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:48:51 JKG-SERVER (python3)[857965]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:48:57 JKG-SERVER (python3)[857972]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:49:02 JKG-SERVER (python3)[857982]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:49:07 JKG-SERVER (python3)[858000]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:49:12 JKG-SERVER (python3)[858010]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:49:18 JKG-SERVER (python3)[858018]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:49:23 JKG-SERVER (python3)[858026]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:49:28 JKG-SERVER (python3)[858032]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:49:33 JKG-SERVER (python3)[858042]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:49:39 JKG-SERVER (python3)[858055]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:49:44 JKG-SERVER (python3)[858070]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:49:49 JKG-SERVER (python3)[858076]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:49:54 JKG-SERVER (python3)[858087]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:50:00 JKG-SERVER (python3)[858093]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:50:05 JKG-SERVER (python3)[858151]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:50:10 JKG-SERVER (python3)[858170]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:50:15 JKG-SERVER (python3)[858180]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:50:21 JKG-SERVER (python3)[858189]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:50:26 JKG-SERVER (python3)[858195]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:50:31 JKG-SERVER (python3)[858203]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:50:36 JKG-SERVER (python3)[858344]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:50:42 JKG-SERVER (python3)[858358]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:50:47 JKG-SERVER (python3)[858368]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:50:52 JKG-SERVER (python3)[858377]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:50:57 JKG-SERVER (python3)[858385]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:51:03 JKG-SERVER (python3)[858395]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:51:08 JKG-SERVER (python3)[858402]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:51:13 JKG-SERVER (python3)[858422]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:51:18 JKG-SERVER (python3)[858430]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:51:24 JKG-SERVER (python3)[858439]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:51:29 JKG-SERVER (python3)[858445]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:51:34 JKG-SERVER (python3)[858455]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:51:39 JKG-SERVER (python3)[858462]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:51:45 JKG-SERVER (python3)[858472]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:51:50 JKG-SERVER (python3)[858482]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:51:55 JKG-SERVER (python3)[858492]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:52:00 JKG-SERVER (python3)[858501]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:52:06 JKG-SERVER (python3)[858509]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:52:11 JKG-SERVER (python3)[858522]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:52:16 JKG-SERVER (python3)[858537]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:52:21 JKG-SERVER (python3)[858545]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:52:26 JKG-SERVER (python3)[858551]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:52:31 JKG-SERVER (python3)[858562]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:52:37 JKG-SERVER (python3)[858569]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:52:42 JKG-SERVER (python3)[858578]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:52:45 JKG-SERVER nmbd[1375]: [2025/12/15 17:52:45.527965,  0] source3/nmbd/nmbd_browsesync.c:355(find_domain_master_name_query_fail)
dic 15 17:52:45 JKG-SERVER nmbd[1375]:   find_domain_master_name_query_fail:
dic 15 17:52:45 JKG-SERVER nmbd[1375]:   Unable to find the Domain Master Browser name WORKGROUP<1b> for the workgroup WORKGROUP.
dic 15 17:52:45 JKG-SERVER nmbd[1375]:   Unable to sync browse lists in this workgroup.
dic 15 17:52:45 JKG-SERVER nmbd[1375]: [2025/12/15 17:52:45.528024,  0] source3/nmbd/nmbd_browsesync.c:355(find_domain_master_name_query_fail)
dic 15 17:52:45 JKG-SERVER nmbd[1375]:   find_domain_master_name_query_fail:
dic 15 17:52:45 JKG-SERVER nmbd[1375]:   Unable to find the Domain Master Browser name WORKGROUP<1b> for the workgroup WORKGROUP.
dic 15 17:52:45 JKG-SERVER nmbd[1375]:   Unable to sync browse lists in this workgroup.
dic 15 17:52:45 JKG-SERVER nmbd[1375]: [2025/12/15 17:52:45.528050,  0] source3/nmbd/nmbd_browsesync.c:355(find_domain_master_name_query_fail)
dic 15 17:52:45 JKG-SERVER nmbd[1375]:   find_domain_master_name_query_fail:
dic 15 17:52:45 JKG-SERVER nmbd[1375]:   Unable to find the Domain Master Browser name WORKGROUP<1b> for the workgroup WORKGROUP.
dic 15 17:52:45 JKG-SERVER nmbd[1375]:   Unable to sync browse lists in this workgroup.
dic 15 17:52:45 JKG-SERVER nmbd[1375]: [2025/12/15 17:52:45.528079,  0] source3/nmbd/nmbd_browsesync.c:355(find_domain_master_name_query_fail)
dic 15 17:52:45 JKG-SERVER nmbd[1375]:   find_domain_master_name_query_fail:
dic 15 17:52:45 JKG-SERVER nmbd[1375]:   Unable to find the Domain Master Browser name WORKGROUP<1b> for the workgroup WORKGROUP.
dic 15 17:52:45 JKG-SERVER nmbd[1375]:   Unable to sync browse lists in this workgroup.
dic 15 17:52:45 JKG-SERVER nmbd[1375]: [2025/12/15 17:52:45.528101,  0] source3/nmbd/nmbd_browsesync.c:355(find_domain_master_name_query_fail)
dic 15 17:52:45 JKG-SERVER nmbd[1375]:   find_domain_master_name_query_fail:
dic 15 17:52:45 JKG-SERVER nmbd[1375]:   Unable to find the Domain Master Browser name WORKGROUP<1b> for the workgroup WORKGROUP.
dic 15 17:52:45 JKG-SERVER nmbd[1375]:   Unable to sync browse lists in this workgroup.
dic 15 17:52:45 JKG-SERVER nmbd[1375]: [2025/12/15 17:52:45.528122,  0] source3/nmbd/nmbd_browsesync.c:355(find_domain_master_name_query_fail)
dic 15 17:52:45 JKG-SERVER nmbd[1375]:   find_domain_master_name_query_fail:
dic 15 17:52:45 JKG-SERVER nmbd[1375]:   Unable to find the Domain Master Browser name WORKGROUP<1b> for the workgroup WORKGROUP.
dic 15 17:52:45 JKG-SERVER nmbd[1375]:   Unable to sync browse lists in this workgroup.
dic 15 17:52:47 JKG-SERVER (python3)[858605]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:52:52 JKG-SERVER (python3)[858614]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:52:58 JKG-SERVER (python3)[858621]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:53:03 JKG-SERVER (python3)[858632]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:53:08 JKG-SERVER (python3)[858638]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:53:13 JKG-SERVER (python3)[858655]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:53:19 JKG-SERVER (python3)[858668]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:53:24 JKG-SERVER (python3)[858676]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:53:29 JKG-SERVER (python3)[858682]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:53:34 JKG-SERVER (python3)[858692]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:53:40 JKG-SERVER (python3)[858700]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:53:45 JKG-SERVER (python3)[858706]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:53:50 JKG-SERVER (python3)[858719]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:53:55 JKG-SERVER (python3)[858728]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:54:01 JKG-SERVER (python3)[858736]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:54:06 JKG-SERVER (python3)[858744]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:54:11 JKG-SERVER (python3)[858753]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:54:16 JKG-SERVER (python3)[858768]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:54:22 JKG-SERVER (python3)[858777]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:54:27 JKG-SERVER (python3)[858787]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:54:32 JKG-SERVER (python3)[858795]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:54:37 JKG-SERVER (python3)[858805]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:54:43 JKG-SERVER (python3)[859159]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:54:48 JKG-SERVER (python3)[859433]: odoo.service: Failed to determine user credentials: No such process
dic 15 17:54:53 JKG-SERVER (python3)[859537]: odoo.service: Failed to determine user credentials: No such process


## NGINX (resumen)

$ nginx -v 2>&1; echo; nginx -t 2>&1 || true; echo; ls -la /etc/nginx/sites-enabled || true
nginx version: nginx/1.24.0 (Ubuntu)

nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful

total 20
drwxr-xr-x  2 root root 4096 dic 15 15:56 .
drwxr-xr-x 13 root root 4096 dic 14 01:45 ..
-rw-r--r--  1 root root   80 dic 14 01:41 00-loopback-default.conf
-rw-r--r--  1 root root  325 dic 13 21:31 nube.tunnel.conf
-rw-r--r--  1 root root 1391 dic 14 01:21 odoo.tunnel.conf
lrwxrwxrwx  1 root root   45 dic 15 15:56 thejoseka-lan.conf -> /etc/nginx/sites-available/thejoseka-lan.conf


## NGINX (config completa nginx -T)

$ TO 15 nginx -T 2>&1 | sed -n '1,420p' || true
bash: línea 1: TO: orden no encontrada


## DNSMASQ (config)

$ dnsmasq --version 2>/dev/null | head -n1 || true; echo; ls -la /etc/dnsmasq.d || true; echo; (sed -n '1,220p' /etc/dnsmasq.conf 2>/dev/null || true); echo; (for f in /etc/dnsmasq.d/*.conf; do echo "--- $f"; sed -n '1,220p' "$f"; done 2>/dev/null || true)
Dnsmasq versión 2.90  Copyright (c) 2000-2024 Simon Kelley

total 28
drwxr-xr-x   2 root root  4096 dic 14 18:39 .
drwxr-xr-x 141 root root 12288 dic 15 17:54 ..
-rw-r--r--   1 root root   140 dic 14 05:26 10-jkg.conf
-rw-r--r--   1 root root   211 ene 14  2025 README
-rw-r--r--   1 root root   222 dic 14 18:47 thejoseka-lan.conf

# Configuration file for dnsmasq.
#
# Format is one option per line, legal options are the same
# as the long options legal on the command line. See
# "/usr/sbin/dnsmasq --help" or "man 8 dnsmasq" for details.

# Listen on this specific port instead of the standard DNS port
# (53). Setting this to zero completely disables DNS function,
# leaving only DHCP and/or TFTP.
#port=5353

# The following two options make you a better netizen, since they
# tell dnsmasq to filter out queries which the public DNS cannot
# answer, and which load the servers (especially the root servers)
# unnecessarily. If you have a dial-on-demand link they also stop
# these requests from bringing up the link unnecessarily.

# Never forward plain names (without a dot or domain part)
#domain-needed
# Never forward addresses in the non-routed address spaces.
#bogus-priv

# Uncomment these to enable DNSSEC validation and caching:
# (Requires dnsmasq to be built with DNSSEC option.)
#conf-file=%%PREFIX%%/share/dnsmasq/trust-anchors.conf
#dnssec

# Replies which are not DNSSEC signed may be legitimate, because the domain
# is unsigned, or may be forgeries. Setting this option tells dnsmasq to
# check that an unsigned reply is OK, by finding a secure proof that a DS 
# record somewhere between the root and the domain does not exist. 
# The cost of setting this is that even queries in unsigned domains will need
# one or more extra DNS queries to verify.
#dnssec-check-unsigned

# Uncomment this to filter useless windows-originated DNS requests
# which can trigger dial-on-demand links needlessly.
# Note that (amongst other things) this blocks all SRV requests,
# so don't use it if you use eg Kerberos, SIP, XMMP or Google-talk.
# This option only affects forwarding, SRV records originating for
# dnsmasq (via srv-host= lines) are not suppressed by it.
#filterwin2k

# Change this line if you want dns to get its upstream servers from
# somewhere other that /etc/resolv.conf
#resolv-file=

# By  default,  dnsmasq  will  send queries to any of the upstream
# servers it knows about and tries to favour servers to are  known
# to  be  up.  Uncommenting this forces dnsmasq to try each query
# with  each  server  strictly  in  the  order  they   appear   in
# /etc/resolv.conf
#strict-order

# If you don't want dnsmasq to read /etc/resolv.conf or any other
# file, getting its servers from this file instead (see below), then
# uncomment this.
#no-resolv

# If you don't want dnsmasq to poll /etc/resolv.conf or other resolv
# files for changes and re-read them then uncomment this.
#no-poll

# Add other name servers here, with domain specs if they are for
# non-public domains.
#server=/localnet/[IP-REDACTED]

# Example of routing PTR queries to nameservers: this will send all
# address->name queries for 192.168.3/24 to nameserver [IP-REDACTED]
#server=/3.168.192.in-addr.arpa/[IP-REDACTED]

# Add local-only domains here, queries in these domains are answered
# from /etc/hosts or DHCP only.
#local=/localnet/

# Add domains which you want to force to an IP address here.
# The example below send any host in double-click.net to a local
# web-server.
#address=/double-click.net/127.0.0.1

# --address (and --server) work with IPv6 addresses too.
#address=/www.thekelleys.org.uk/fe80::20d:60ff:fe36:f83

# Add the IPs of all queries to yahoo.com, google.com, and their
# subdomains to the vpn and search ipsets:
#ipset=/yahoo.com/google.com/vpn,search

# Add the IPs of all queries to yahoo.com, google.com, and their
# subdomains to netfilters sets, which is equivalent to
# 'nft add element ip test vpn { ... }; nft add element ip test search { ... }'
#nftset=/yahoo.com/google.com/ip#test#vpn,ip#test#search

# Use netfilters sets for both IPv4 and IPv6:
# This adds all addresses in *.yahoo.com to vpn4 and vpn6 for IPv4 and IPv6 addresses.
#nftset=/yahoo.com/4#ip#test#vpn4
#nftset=/yahoo.com/6#ip#test#vpn6

# You can control how dnsmasq talks to a server: this forces
# queries to [IP-REDACTED] to be routed via eth1
# server=[IP-REDACTED]@eth1

# and this sets the source (ie local) address used to talk to
# [IP-REDACTED] to [IP-REDACTED] port 55 (there must be an interface with that
# IP on the machine, obviously).
# server=[IP-REDACTED]@[IP-REDACTED]#55

# If you want dnsmasq to change uid and gid to something other
# than the default, edit the following lines.
#user=
#group=

# If you want dnsmasq to listen for DHCP and DNS requests only on
# specified interfaces (and the loopback) give the name of the
# interface (eg eth0) here.
# Repeat the line for more than one interface.
#interface=
# Or you can specify which interface _not_ to listen on
#except-interface=
# Or which to listen on by address (remember to include 127.0.0.1 if
# you use this.)
#listen-address=
# If you want dnsmasq to provide only DNS service on an interface,
# configure it as shown above, and then use the following line to
# disable DHCP and TFTP on it.
#no-dhcp-interface=

# On systems which support it, dnsmasq binds the wildcard address,
# even when it is listening on only some interfaces. It then discards
# requests that it shouldn't reply to. This has the advantage of
# working even when interfaces come and go and change address. If you
# want dnsmasq to really bind only the interfaces it is listening on,
# uncomment this option. About the only time you may need this is when
# running another nameserver on the same machine.
#bind-interfaces

# If you don't want dnsmasq to read /etc/hosts, uncomment the
# following line.
#no-hosts
# or if you want it to read another file, as well as /etc/hosts, use
# this.
#addn-hosts=/etc/banner_add_hosts

# Set this (and domain: see below) if you want to have a domain
# automatically added to simple names in a hosts-file.
#expand-hosts

# Set the domain for dnsmasq. this is optional, but if it is set, it
# does the following things.
# 1) Allows DHCP hosts to have fully qualified domain names, as long
#     as the domain part matches this setting.
# 2) Sets the "domain" DHCP option thereby potentially setting the
#    domain of all systems configured by DHCP
# 3) Provides the domain part for "expand-hosts"
#domain=thekelleys.org.uk

# Set a different domain for a particular subnet
#domain=wireless.thekelleys.org.uk,[IP-REDACTED]/24

# Same idea, but range rather then subnet
#domain=reserved.thekelleys.org.uk,192.68.3.100,[IP-REDACTED]

# Uncomment this to enable the integrated DHCP server, you need
# to supply the range of addresses available for lease and optionally
# a lease time. If you have more than one network, you will need to
# repeat this for each network on which you want to supply DHCP
# service.
#dhcp-range=[IP-REDACTED],[IP-REDACTED],12h

# This is an example of a DHCP range where the netmask is given. This
# is needed for networks we reach the dnsmasq DHCP server via a relay
# agent. If you don't know what a DHCP relay agent is, you probably
# don't need to worry about this.
#dhcp-range=[IP-REDACTED],[IP-REDACTED],255.255.255.0,12h

# This is an example of a DHCP range which sets a tag, so that
# some DHCP options may be set only for this network.
#dhcp-range=set:red,[IP-REDACTED],[IP-REDACTED]

# Use this DHCP range only when the tag "green" is set.
#dhcp-range=tag:green,[IP-REDACTED],[IP-REDACTED],12h

# Specify a subnet which can't be used for dynamic address allocation,
# is available for hosts with matching --dhcp-host lines. Note that
# dhcp-host declarations will be ignored unless there is a dhcp-range
# of some type for the subnet in question.
# In this case the netmask is implied (it comes from the network
# configuration on the machine running dnsmasq) it is possible to give
# an explicit netmask instead.
#dhcp-range=[IP-REDACTED],static

# Enable DHCPv6. Note that the prefix-length does not need to be specified
# and defaults to 64 if missing/
#dhcp-range=1234::2, 1234::500, 64, 12h

# Do Router Advertisements, BUT NOT DHCP for this subnet.
#dhcp-range=1234::, ra-only 

# Do Router Advertisements, BUT NOT DHCP for this subnet, also try and
# add names to the DNS for the IPv6 address of SLAAC-configured dual-stack 
# hosts. Use the DHCPv4 lease to derive the name, network segment and 
# MAC address and assume that the host will also have an
# IPv6 address calculated using the SLAAC algorithm.
#dhcp-range=1234::, ra-names

# Do Router Advertisements, BUT NOT DHCP for this subnet.
# Set the lifetime to 46 hours. (Note: minimum lifetime is 2 hours.)
#dhcp-range=1234::, ra-only, 48h

# Do DHCP and Router Advertisements for this subnet. Set the A bit in the RA
# so that clients can use SLAAC addresses as well as DHCP ones.
#dhcp-range=1234::2, 1234::500, slaac

# Do Router Advertisements and stateless DHCP for this subnet. Clients will
# not get addresses from DHCP, but they will get other configuration information.
# They will use SLAAC for addresses.
#dhcp-range=1234::, ra-stateless

# Do stateless DHCP, SLAAC, and generate DNS names for SLAAC addresses
# from DHCPv4 leases.
#dhcp-range=1234::, ra-stateless, ra-names

--- /etc/dnsmasq.d/10-jkg.conf
interface=eno1
listen-address=[IP-REDACTED]
bind-dynamic
domain-needed
bogus-priv
cache-size=10000

no-resolv
server=1.1.1.1
server=1.0.0.1
--- /etc/dnsmasq.d/thejoseka-lan.conf
# Split-DNS LAN: apunta dominio a tu server (IPv4 + IPv6 LAN)
host-record=odoo.thejoseka.com,[IP-REDACTED],fd87:7b42:69e:0:725a:fff:fe4a:bc13
host-record=nube.thejoseka.com,[IP-REDACTED],fd87:7b42:69e:0:725a:fff:fe4a:bc13


## Certbot / LetsEncrypt (lista)

$ certbot --version 2>/dev/null || true; echo; ls -la /etc/letsencrypt/live 2>/dev/null || true; echo; find /etc/letsencrypt/renewal -maxdepth 1 -type f -name '*.conf' -print 2>/dev/null || true
certbot 2.9.0

total 20
drwx------ 4 root root 4096 nov 29 06:38 .
drwxr-xr-x 7 root root 4096 dic 15 16:52 ..
drwxr-xr-x 2 root root 4096 nov 29 06:38 nube.thejoseka.com
drwxr-xr-x 2 root root 4096 nov 27 00:53 odoo.thejoseka.com
-rw-r--r-- 1 root root  740 nov 27 00:53 README

/etc/letsencrypt/renewal/odoo.thejoseka.com.conf
/etc/letsencrypt/renewal/nube.thejoseka.com.conf


## Tailscale (estado)

$ tailscale status 2>/dev/null || true; echo; tailscale ip -4 2>/dev/null || true; echo; tailscale ip -6 2>/dev/null || true
[IP-REDACTED]  jkg-server        naposikeit@        linux    idle; offers exit node                                   
[IP-REDACTED]  glsdb             naposikeit@        linux    offline, last seen 25d ago                               
[IP-REDACTED]      iphone-elisabeth  elisabethgragera@  iOS      offline, last seen 6d ago                                
[IP-REDACTED]    iphone-joseka     naposikeit@        iOS      offline, last seen 2h ago                                
[IP-REDACTED]   jkg-taller        naposikeit@        linux    offline, last seen 17d ago                               
[IP-REDACTED]    jkg               naposikeit@        windows  offline, last seen 22h ago                               
[IP-REDACTED]    parrot            naposikeit@        linux    offline, last seen 2d ago                                
[IP-REDACTED]    pepe              naposikeit@        windows  offline, last seen 2d ago                                
[IP-REDACTED]    salon             naposikeit@        linux    active; direct [IP-REDACTED]:41641, tx 125716 rx 108132  

[IP-REDACTED]

fd7a:115c:a1e0::3401:ba86


## Tailscale (prefs debug)

$ TO 10 tailscale debug prefs 2>/dev/null || true


## Docker (estado)

$ docker version; echo; docker info 2>/dev/null | sed -n '1,220p' || true
Client: Docker Engine - Community
 Version:           29.1.3
 API version:       1.52
 Go version:        go1.25.5
 Git commit:        f52814d
 Built:             Fri Dec 12 14:49:32 2025
 OS/Arch:           linux/amd64
 Context:           default

Server: Docker Engine - Community
 Engine:
  Version:          29.1.3
  API version:      1.52 (minimum version 1.44)
  Go version:       go1.25.5
  Git commit:       fbf3ed2
  Built:            Fri Dec 12 14:49:32 2025
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          v2.2.0
  GitCommit:        1c4457e00facac03ce1d75f7b6777a7a851e5c41
 runc:
  Version:          1.3.4
  GitCommit:        v1.3.4-0-gd6d73eb8
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0

Client: Docker Engine - Community
 Version:    29.1.3
 Context:    default
 Debug Mode: false
 Plugins:
  buildx: Docker Buildx (Docker Inc.)
    Version:  v0.30.1
    Path:     /usr/libexec/docker/cli-plugins/docker-buildx
  compose: Docker Compose (Docker Inc.)
    Version:  v5.0.0
    Path:     /usr/libexec/docker/cli-plugins/docker-compose

Server:
 Containers: 7
  Running: 7
  Paused: 0
  Stopped: 0
 Images: 17
 Server Version: 29.1.3
 Storage Driver: overlay2
  Backing Filesystem: extfs
  Supports d_type: true
  Using metacopy: false
  Native Overlay Diff: true
  userxattr: false
 Logging Driver: json-file
 Cgroup Driver: systemd
 Cgroup Version: 2
 Plugins:
  Volume: local
  Network: bridge host ipvlan macvlan null overlay
  Log: awslogs fluentd gcplogs gelf journald json-file local splunk syslog
 CDI spec directories:
  /etc/cdi
  /var/run/cdi
 Swarm: inactive
 Runtimes: io.containerd.runc.v2 runc
 Default Runtime: runc
 Init Binary: docker-init
 containerd version: 1c4457e00facac03ce1d75f7b6777a7a851e5c41
 runc version: v1.3.4-0-gd6d73eb8
 init version: de40ad0
 Security Options:
  apparmor
  seccomp
   Profile: builtin
  cgroupns
 Kernel Version: 6.8.0-90-generic
 Operating System: Ubuntu 24.04.3 LTS
 OSType: linux
 Architecture: x86_64
 CPUs: 4
 Total Memory: 46.93GiB
 Name: JKG-SERVER
 ID: d281a5d3-9d0b-457d-bcc8-333050275ce6
 Docker Root Dir: /var/lib/docker
 Debug Mode: false
 Experimental: false
 Insecure Registries:
  127.0.0.0/8
  ::1/128
 Live Restore Enabled: false
 Firewall Backend: iptables



## Docker (contenedores)

$ docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Image}}\t{{.Ports}}" | sed -n '1,260p'
NAMES                STATUS        IMAGE                              PORTS
cloudflared-tunnel   Up 38 hours   cloudflare/cloudflared:2025.11.1   
jkg-odoo-web         Up 44 hours   odoo:19                            127.0.0.1:8069->8069/tcp, 127.0.0.1:8072->8072/tcp, 8071/tcp
jkg-odoo-db          Up 44 hours   postgres:15                        5432/tcp
nextcloud_app        Up 2 days     nextcloud:29-apache                0.0.0.0:8082->80/tcp, [::]:8082->80/tcp
nextcloud_db         Up 2 days     mariadb:10.11                      3306/tcp
nextcloud_redis      Up 2 days     redis:alpine                       6379/tcp
portainer            Up 2 days     portainer/portainer-ce:latest      0.0.0.0:8000->8000/tcp, [::]:8000->8000/tcp, 0.0.0.0:9443->9443/tcp, [::]:9443->9443/tcp, 9000/tcp


## Docker (redes/volúmenes)

$ docker network ls; echo; docker volume ls | sed -n '1,260p'
NETWORK ID     NAME                      DRIVER    SCOPE
a27998e765ec   bridge                    bridge    local
5e0c43fac1b3   host                      host      local
7b03fbe48be0   nextcloud_nextcloud-net   bridge    local
ce54daa5efd6   nextcloud_nextcloud_net   bridge    local
3b9f3688665c   none                      null      local
b1dc2e5340d9   odoo19_default            bridge    local
799851584ab4   odoo_jkg-odoo-net         bridge    local

DRIVER    VOLUME NAME

