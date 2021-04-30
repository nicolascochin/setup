# setup new machine
## Init Silverblue
[Execute](silverblue.sh)
## Shell 
```shell
  curl -s https://raw.githubusercontent.com/nicolascochin/setup/main/setup_shell.sh | sh
```
## Dev toolbox 
### Create the toolbox 
```shell
toolbox create -c dev 
toolbox enter dev
```
### Setup
```shell
sh <(curl -s https://raw.githubusercontent.com/nicolascochin/setup/main/toolbox_dev.sh)
```


### Upgrade
```shell
rpm-ostree rebase fedora:fedora/34/x86_64/silverblue --uninstall rpmfusion-free-release-33-1.noarch --install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-branched.noarch.rpm --uninstall rpmfusion-nonfree-release-33-1.noarch --install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-branched.noarch.rpm
```
