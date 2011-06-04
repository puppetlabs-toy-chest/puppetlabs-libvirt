# libvirt Module

This module manages libvirt from within Puppet.

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
