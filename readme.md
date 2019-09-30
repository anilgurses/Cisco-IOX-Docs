# Cisco IOX App Development
 ## General Information
 Cisco IOX is an app deployment service which is created by Cisco Systems and used in cisco's specific industrial routers. I am writing this document for who is suffering from problems when deploying apps on IOX. I may have some wrongs at the document.If you find one, please open an issue above.
## Development Enviroment
I have Cisco IR829 with 50Gb m2Sata Ssd. I developed *Docker* type apps and *VM* type apps. My current development is decribed below. This enviroment satisfies all the apps development proccess which is written in this repository.

```
Mac OS Mojave 10.14.5
CISCO IOS 15.7
CISCO IOX 1.7
ioxclient v1.8
Docker v2.0.0.3
Silicon Labs FTDI driver (for serial console access)
Ubuntu Server 16.04 VM(For VM app development)
brew
Qemu
```
## Docker images I tried

```
* Alpine: 3.9 (Success)
* Alpine: 3.8 (Success)
* Alpine: 3.7 (Success)
* Ubuntu: bionic (Success)
* Ubuntu: 16.04 (Success)
* Debian: Stretch (Success)
* Oraclelinux: Slim (Fail)
* Yocto (LVM) (Success)
```
For storage issues, use Alpine images. Alpine is a minimal linux distro. Some of the packages not available. Therefore, it may not work for your projects as some of mine.

# Essentials of package.yaml
* Please don't add your starter command for your app at the dockerfile. It will be ignored. Such as "npm install -g serve" command. If you add, that would be useless. Add that command on your package.yaml file.
* If you need to specify disk size. Please add disk property below of the resources section on the package.yaml file
* You have to add command to *targets* property. If you don't, your app would be stopped after the start.
* Some of the features not available on every descriptor schema version. Carefully review the IOX docs on the cisco devnet.

# Docker Type Apps 

## Essentials
* If you have app that hosts something, please kno

# Dockerfiles
I added dockerfiles which are work on IOX perfectly :). If you have an application which uses php or react, you can easily integrate your project with my Dockerfiles. Please look the Dockerfile folder on the repository. 

# Package.yaml files
I also added my package.yaml files to the repository. Package.yaml files are on the package.yaml's folder.


# IOS Base Configuration for IOX
My running configuration is here. I removed my personal information such as passwords. I wrote *####Fill####* for you to fill the given blank for yourself. If you don't know the how to configure your IOS, please read [[this]] .


# Troubleshooting
I wrote problems which I encountered at the development and their solutions.Please look  troubleshooting.md file.
