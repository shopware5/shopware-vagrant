Vagrant Shopware Box
====================

## Installation

Virtualbox and Vagrant have to be installed on your local machine:

 - [Virtualbox](https://www.virtualbox.org/wiki/Downloads).
 - [Vagrant](https://www.vagrantup.com/downloads).

The provision is done by [Ansible](http://www.ansibleworks.com/docs/) directly on the created vm.

## Usage
First Boot-Up your vagrant virtual machine:

    $ cd vagrant
    $ vagrant up

The first boot may take a while, so feel free to get a cup of coffee.

Your machine will be available at [http://33.33.33.10/](http://33.33.33.10/)

To SSH into the created VM:

    $ vagrant ssh


If you use Putty the ssh configuration can be obtained via:

    $ vagrant ssh-config


To reprovision your machine:

    $ vagrant provision


## Installation under arch linux

    sudo pacman -S virtualbox ansible net-tools nfs-utils
    sudo modprobe -a vboxdrv vboxnetadp vboxnetflt
    sudo systemctl start nfs-server

## License

The MIT License (MIT). Please see [License File](LICENSE) for more information.
