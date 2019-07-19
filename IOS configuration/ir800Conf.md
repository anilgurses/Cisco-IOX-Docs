Current configuration : 8085 bytes
!
! Last configuration change at 13:17:05 GMT Wed Jun 26 2019 by admin
!
version 15.7
service timestamps debug datetime msec
service timestamps log datetime msec
no service password-encryption
!
hostname ####Fill####
!
boot-start-marker
boot system flash:/ir800-universalk9-mz.SSA.157-3.0m.GB1158
boot-end-marker
!
!
logging buffered 51200 warnings
enable password ####Fill####
!
no aaa new-model
clock timezone GMT 3 0
service-module wlan-ap 0 bootimage autonomous
!
ignition off-timer 900
!
ignition undervoltage threshold 11
!
no ignition enable
!
!
!
!
ip dhcp excluded-address 172.16.1.1 172.16.1.5
ip dhcp excluded-address 10.10.10.1 10.10.10.5
!
ip dhcp pool ioxpool
 network 172.16.1.0 255.255.255.0
 default-router 172.16.1.1
 domain-name cisco.com
 dns-server 8.8.8.8
   remember
!
ip dhcp pool ccp-pool
 import all
 network 10.10.10.0 255.255.255.128
 default-router 10.10.10.1
 dns-server 8.8.8.8
 lease 0 2
!
!
!
flow record nbar-appmon
 match ipv4 source address
 match ipv4 destination address
 match application name
 collect interface output
 collect counter bytes
 collect counter packets
 collect timestamp absolute first
 collect timestamp absolute last
!
multilink bundle-name authenticated
!
!
chat-script lte "" "AT!CALL" TIMEOUT 20 "OK"
!
crypto pki trustpoint TP-self-signed-422713650
 enrollment selfsigned
 subject-name cn=IOS-Self-Signed-Certificate-422713650
 revocation-check none
 rsakeypair TP-self-signed-422713650
!
!
crypto pki certificate chain TP-self-signed-422713650
 certificate self-signed 01
  30820229 30820192 A0030201 02020101 300D0609 2A864886 F70D0101 05050030
  30312E30 2C060355 04031325 494F532D 53656C66 2D536967 6E65642D 43657274
  69666963 6174652D 34323237 31333635 30301E17 0D313930 36323531 31303831
  305A170D 32303031 30313030 30303030 5A303031 2E302C06 03550403 1325494F
  532D5365 6C662D53 69676E65 642D4365 72746966 69636174 652D3432 32373133
  36353030 819F300D 06092A86 4886F70D 01010105 0003818D 00308189 02818100
  CC779A9E 9A21C39E 504477C2 8060A608 40F6C2DB D1544F25 9D33AF70 A09DB03B
  E56562AC 966D7A8E 2DAEBCD0 8A0B87B8 229D4422 954A3096 19CD2C99 1CB8BFA0
  841767E5 FB4F0BD5 68F28825 6C391D7E B9C1F7AB 9EF0EA42 74238DE8 3F1E86AD
  6DDD983D DF3C452C E43325EC 091A4C74 BF66513F 2B827D71 E64A05A4 E2F50DEF
  02030100 01A35330 51300F06 03551D13 0101FF04 05300301 01FF301F 0603551D
  23041830 1680143B 9BC43AA7 920DEBA1 9E290950 814EAFF3 41C28A30 1D060355
  1D0E0416 04143B9B C43AA792 0DEBA19E 29095081 4EAFF341 C28A300D 06092A86
  4886F70D 01010505 00038181 0008D73C 9C6F41A7 CDAB1C46 E515543B 26F9EA3E
  DD20E2EB 238A604B F77C46EB 0FD150AC 4C74AB43 71817CCB 2CB7FEAA 0D1ABECD
  97AF27EE 31A3C287 9FF6158F 7CB74E72 E5C24937 0B9EF4B0 3CBCEC19 95F57F4D
  E2342BB6 77627E17 E53BE8DE 30086C69 0BBD48A4 80BAEECB 83A5236E 9E564F02
  C0DA4EE8 C1E86FDB 088E0683 85
  	quit
license udi pid IR829M-2LTE-EA-EK9 sn FGL21529165
!
!
object-group network local_lan_subnets
 10.10.10.0 255.255.255.128
 172.16.1.0 255.255.255.0
 any
!
object-group network vpn_remote_subnets
 any
!
username admin privilege 15 password 0 ####Fill####
username ciscocp privilege 15 secret 5 $1$NOjh$5RWPF/OzJLHH9HEuhqma4/
!
redundancy

!
!
controller Cellular 0
 lte modem link-recovery rssi onset-threshold -110
 lte modem link-recovery monitor-timer 20
 lte modem link-recovery wait-timer 10
 lte modem link-recovery debounce-count 6
!
controller Cellular 1
 no lte gps enable
 lte modem link-recovery rssi onset-threshold -110
 lte modem link-recovery monitor-timer 20
 lte modem link-recovery wait-timer 10
 lte modem link-recovery debounce-count 6
!
!
!
!
!
interface GigabitEthernet0
 description PrimaryWANDesc_
 ip address dhcp hostname ####Fill####
 ip nat outside
 ip virtual-reassembly in
 shutdown
 no keepalive
!
interface GigabitEthernet1
 switchport access vlan 555
 switchport mode access
 no ip address
!
interface GigabitEthernet2
 switchport access vlan 555
 switchport mode access
 no ip address
!
interface GigabitEthernet3
 switchport access vlan 555
 switchport mode access
 no ip address
!
interface GigabitEthernet4
 switchport access vlan 555
 switchport mode access
 no ip address
!
interface Wlan-GigabitEthernet0
 no ip address
!
interface GigabitEthernet5
 ip address 172.16.1.1 255.255.255.0
 ip nat inside
 ip virtual-reassembly in
 duplex auto
 speed auto
 ipv6 address autoconfig
 ipv6 enable
!
interface Cellular0/0
 no ip address
 encapsulation slip
 dialer in-band
 dialer string lte
!
interface Cellular1/0
 no ip address
 encapsulation slip
 dialer in-band
 dialer string lte
!
interface Cellular0/1
 no ip address
 encapsulation slip
!
interface Cellular1/1
 no ip address
 encapsulation slip
!
interface wlan-ap0
 ip address 10.1.1.1 255.255.255.255
!
interface Vlan1
 description $ETH_LAN$
 ip address 10.10.10.1 255.255.255.128
 ip nat inside
 ip virtual-reassembly in
 ip tcp adjust-mss 1452
!
interface Vlan555
 ip address dhcp hostname ####Fill####
 ip nat outside
 ip virtual-reassembly in
!
interface Async0
 no ip address
 encapsulation relay-line
 half-duplex
 media-type rs485
!
interface Async1
 no ip address
 encapsulation relay-line
!
ip forward-protocol nd
!
ip http server
ip http upload enable path flash:
ip http upload overwrite
ip http access-class 23
ip http authentication local
ip http secure-server
ip http timeout-policy idle 60 life 86400 requests 10000
!
ip dns server
ip nat inside source static tcp 172.16.1.6 22 interface Vlan555 2222
ip nat inside source static tcp 172.16.1.6 8443 interface Vlan555 8443
ip nat inside source list nat-list interface Vlan555 overload
ip nat inside source static tcp 10.10.10.1 443 interface Vlan555 6000
ip nat inside source static tcp 172.16.1.6 5000 interface Vlan555 5000
ip nat inside source static tcp 10.21.0.20 843 interface Vlan555 843
ip nat inside source static tcp 10.10.10.1 80 interface Vlan555 600
ip nat inside source static tcp 10.1.1.1 2004 interface Vlan555 2004
ip nat inside source static tcp 10.1.1.1 443 interface Vlan555 204
ip nat inside source static tcp 10.1.1.1 80 interface Vlan555 800
!
ip access-list extended nat-list
 permit ip object-group local_lan_subnets any
 permit ip any any
!
dialer-list 1 protocol ip permit
dialer-list 1 protocol ipv6 permit
!
!
access-list 1 permit any
access-list 23 permit 10.10.10.0 0.0.0.127
access-list 23 permit 172.16.1.0 0.0.0.255
access-list 23 permit any
!
control-plane
!
!
!
 vstack
!
line con 0
 stopbits 1
line 1 2
 transport preferred none
 transport input all
 transport output all
 stopbits 1
 speed 19200
line 3
 script dialer lte
 no exec
 transport preferred pad telnet rlogin lapb-ta mop udptn v120 ssh
 transport output pad telnet rlogin lapb-ta mop udptn v120 ssh
line 4
 no activation-character
 no exec
 transport preferred none
 transport input all
 transport output pad telnet rlogin lapb-ta mop udptn v120 ssh
line 8
 no exec
 transport preferred pad telnet rlogin lapb-ta mop udptn v120 ssh
 transport output pad telnet rlogin lapb-ta mop udptn v120 ssh
line 9
 script dialer lte
 no exec
 transport preferred pad telnet rlogin lapb-ta mop udptn v120 ssh
 transport output pad telnet rlogin lapb-ta mop udptn v120 ssh
line 15
 no exec
 transport preferred pad telnet rlogin lapb-ta mop udptn v120 ssh
 transport output pad telnet rlogin lapb-ta mop udptn v120 ssh
line 1/3
 transport preferred none
 transport input all
 transport output none
 stopbits 1
line 1/4
 login local
 transport preferred none
 transport input all
 transport output all
 stopbits 1
 speed 19200
line 1/5 1/6
 transport preferred none
 transport input all
 transport output none
 stopbits 1
 speed 19200
line vty 0 4
 access-class 23 in
 privilege level 15
 login local
 transport input telnet ssh
line vty 5 15
 access-class 23 in
 privilege level 15
 login local
 transport input telnet ssh
!
no scheduler max-task-time
relay line 1 1/5
relay line 2 1/6
ntp server 192.168.103.52
iox client enable interface GigabitEthernet5
no iox recovery-enable
!
!
!
!
!
!
end
