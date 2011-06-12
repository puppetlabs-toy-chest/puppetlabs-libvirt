# libvirt Module

This module manages software to install and configure libvirt from within 
Puppet. 

It does not take care of the creation of virtual instances - if you wish to
manage instances directly in Puppet use:

https://github.com/carlasouza/puppet-virt

# Quick Start

Setup libvirt.

    node "kvm1" {
        class { "libvirt": }
    }

Setup and configure libvirt:

    node "kvm1" {
      class { libvirt:
        libvirtd_config => {
          max_clients => { value => 10 },
        },
        qemu_config => {
          vnc_listen => { value => "0.0.0.0" },
        },
      }
    }
