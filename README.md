Vagrant Shopware Box
====================

## Installation

Virtualbox and Vagrant have to be installed on your local machine:

 - [Virtualbox](https://www.virtualbox.org/wiki/Downloads).
 - [Vagrant](https://www.vagrantup.com/downloads).

The provision is done by [Ansible](http://www.ansibleworks.com/docs/) directly on the created vm.

## Usage

Clone the repository to your local machine.

    $ git clone https://github.com/shopwareLabs/shopware-vagrant
    $ cd shopware-vagrant

Boot up your vagrant virtual machine:

    $ cd vagrant
    $ vagrant up

The first boot may take a while, so feel free to get a cup of coffee.

Your machine will be available at [http://192.168.33.10/](http://192.168.33.10/)
All required tools like the LAMP stack are already installed.

- PHPMyAdmin: [http://192.168.33.10/phpmyadmin](http://192.168.33.10/phpmyadmin)
- MySQL user: `root`, password: `shopware`

To SSH into the created VM:

    $ vagrant ssh

If you use Putty the ssh configuration can be obtained via:

    $ vagrant ssh-config

To reprovision your machine:

    $ vagrant provision

## Installing Shopware

SSH first into your VM:

    $ vagrant ssh

Clone the Shopware repository:

    $ cd www
    $ git clone https://github.com/shopware/shopware
    $ cd shopware

List all available versions with `git tag --list` and checkout the version of your choice, for instance:

    $ git checkout v5.1.6

Configure Shopware:

    $ cd build
    $ ant configure

using the following parameters:

- db-host: `localhost` (default)
- db-port: `3306` (default)
- db-name: `shopware`
- db-username: `root`
- db-password: `shopware`
- app.host: `192.168.33.10`
- app.path: `/shopware`

Build Shopware:

    $ ant build-unit

Download test images:

    $ cd ..
    $ wget -O test_images.zip http://releases.s3.shopware.com/test_images.zip
    $ unzip test_images.zip

Configure your online store in a web browser with the credentials demo/demo:

- Backend: [http://192.168.33.10/shopware/backend/](http://192.168.33.10/shopware/backend/)

You can then access your storefront at:

- Front-end: [http://192.168.33.10/shopware/](http://192.168.33.10/shopware/)

## Installation under arch linux

    sudo pacman -S virtualbox ansible net-tools nfs-utils
    sudo modprobe -a vboxdrv vboxnetadp vboxnetflt
    sudo systemctl start nfs-server

## License

The MIT License (MIT). Please see [License File](LICENSE) for more information.
