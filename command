查看版本信息 cat /etc/issue
版本号       lsb_release -a
系统内核版本  cat /proc/version
内核版本      uname -a
查看usb设备   lsusb
查看内核加载的模块  lsmod
查看网卡状态  sudo ethtool eth0
查看cpu信息   cat /proc/cpuinfo
查看当前硬件信息  lshw
查看系统分区  sudo fdisk -l
为一块新的SCSI硬盘分区  fdisk /dev/sdb
查看硬盘剩余空间  df -h
查看当前内存使用情况  free -m
查看当前有哪些进程    ps -A
杀死一个进程   kill 进程号
强制杀死一个进程  kill -9 进程号
更改属主      chown root /home
更改属组      chgrp root /home
创建一个新用户 Useradd  用户名
创建一个新组   Groupadd 组名
为用户创建密码 Passwd 用户名
删除用户密码   Passwd -d 用户名
查询账户密码   Passwd -S 用户名
为用户更名     Usermod -l 新用户名 老用户名
删除用户一切   Userdel -r 用户名
重启Linux系统  reboot Init 6
关闭Linux系统  Halt Init 0 Shotdown -h now
--------------打包/解包------------
tar -c 创建包 -x 释放包 -v 显示命令过程 -z 代表压缩包
tar -cvf benet.tar /home/benet 把/home/benet目录打包
tar -zcvf benet.tar.gz /mnt 把目录打包并压缩
tar -zxvf benet.tar.gz 压缩包的文件解压恢复
tar -jxvf benet.tar.bz2 解压缩
-------make编译------------
make 编译
make install 安装编译好的源码包
---------apt命令------------
apt-cache search package  搜索包
apt-cache show package    获取包的相关信息
sudo apt-get install package  安装包
sudo apt-get install package --reinstall 重新安装包
sudo apt-get -f install   修复安装 -f = -fix-missing
sudo apt-get remove package 删除包
sudo apt-get remove package --purge 删除包，包括删除配置文件等
sudo apt-get update  更新源
sudo apt-get upgrade  更新以安装的包
sudo apt-get dist-upgrade  升级系统
sudo apt-get dselect-upgrade  使用dselect升级
apt-cache depends package 了解使用依赖
apt-cache rdepends package 查看该包被哪些包依赖
sudo apt-get build-dep package  安装相关的编译环境
apt-get source package  下载该包的源代码
sudo apt-get clean && sudo apt-get autoclean  清理无用的包
sudo apt-get check  检查是否有损坏的依赖
sudo apt-get clean  清理所有软件缓存
(缓存在/var/cache/apt/arachives目录里的deb包)
------查看软件xxx安装内容
dpkg -L xxx
-----查找软件-------
apt-cache search 正则表达式
-----查找文件属于哪个包------
dpkg -S filename apt-file search filename
-----查询软件xxx依赖哪些包----
apt-cache depends xxx
-----查询软件xxx被哪些包依赖---
apt-cache rdepends xxx
-----增加一个光盘源------
sudo apt-cdrom add
-----系统升级------------
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
--------清除所有删除包的残余配置文件---------
dpkg -l | grep ^rc | awk '{print $2}' | tr ["\n"] [" "] | sudo xargs dpkg -p -
--------编译时缺少h文件的自动处理--------
sudo auto-apt run ./configure
--------查看安装软件时下载包的临时存放目录------
ls /var/cache/apt/archives
--------备份当前系统安装的所有包的列表----------
dpkg -get-selections | grep -v deinstall > ~/somefile
--------从上面备份的安装包的列表文件恢复所有包-----
dpkg -set-selections < ~/somefiles sudo dselect
--------清理旧版本的软件缓存------------
sudo apt-get autoclean
--------清理所有软件缓存----------------
sudo apt-get clean
--------删除系统不再使用的孤立软件-------
sudo apt-get autoremove
--------查看包在服务器上面的地址---------
apt-get -qq -print-uris install ssh | cut -d\' -f2
----------------------------------------------------------------------------------
