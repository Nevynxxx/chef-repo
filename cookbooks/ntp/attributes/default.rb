case platform 
when "ubuntu","debian"
  default[:ntp][:service] = "ntp"
when "redhat","centos","fedora","scientific"
  default[:ntp][:service] = "ntpd"
end

default[:ntp][:is_server] = false
default[:ntp][:servers]   = ["ntp2a.mcc.ac.uk", "ntp2b.mcc.ac.uk", "ntp2c.mcc.ac.uk"] 
default[:ntp][:peers] = []
default[:ntp][:restrictions] = []
