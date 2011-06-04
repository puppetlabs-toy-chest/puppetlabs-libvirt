# This resource sets configuration items within libvirtd.conf.
#
# == Parameters
#
# [namevar]
#   This is the parameter you wish to change. For example 'unix_sock_group'.
# [value]
#   The value you wish to set the parameter to.
#
# == Examples
#
#   libvirt::libvirtd_config { "unix_sock_group":
#     value => "sasl",
#   }
#
# == Authors
#
# Ken Barber <ken@bob.sh>
#
# == Copyright
#
# Copyright 2011 Puppetlabs Inc, unless otherwise noted.
#
define libvirt::libvirtd_config(

  $value

  ) {

  file { "/etc/libvirt/libvirtd.d/${name}":
    content => inline_template('<%= name %>=<% if value.kind_of?(Array) %>["<%= value.join("\",\"") %>"]<% elsif value.match(/^[1-9]\d*/) %><%=value%><% else %>"<%= value %>"<% end %><%= "\n" %>'),
    notify => Exec["create_libvirtd_conf"],
  }

}
