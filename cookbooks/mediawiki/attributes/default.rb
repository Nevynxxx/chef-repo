case platform
when "redhat","centos","fedora","suse"
  default[:apache][:user]    = "apache"
when "arch"
  default[:apache][:user]    = "http"
else
  default[:apache][:user]    = "www-data"
end
