# Troubleshooting
## Internal server error while "sending request to install app"

You are probably trying to upload container that is not compatible with the IOX such as oraclelinux. As Cisco IOX doc says, some of the system may not be work. Please look for alternative docker base images.

## Guest-Os is running but IOX is not working as expected.(CAF is not started)

You probably did everything right but you missed disk-partititon. For this situation, you probably accessing IOX well. However, you cannot deploy or upload any app to IOX. This is problem arises from disk partition. I should say that you have succesfully setted up the IOX. You have make disk partition.

Assuming that you connected your device with serial console or telnet or ssh. Please apply these commands on IOS.

```
# enable
# guest-os 1 stop
# guest-os 1 disk-repartition 1
# guest-os 1 start
```

After those commands, IOX can start CAF.

## Operation: start failed. Error while changing app state: App got crashed, before CAF can setup the networking

When ioxclient converts your docker image to tar file, it reads your package.yaml file, as you probably know that. package.yaml file include target property. You have to write a terminal command there. This terminal command would be converted and inserted to startcontainer.sh file.This file makes your all configuration and at the end, starts your target command.Networking is setted up before the target command. However, your docker image setted up before the everything.Probably your app trying to retrieve ip or your app really has a problem. Advise for getting these error, not run your network required commands at Dockerfile.That's my theory. I tried to find answers for those questions.As you predict, I didn't find. Probably, I am the only mankind that deploy php, mysql,nosql,react etc. type apps on that device :)