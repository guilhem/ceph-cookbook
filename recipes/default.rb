# Ceph cookbooks - as the Ceph-people don't release theirs to work with...

#include_recipe "ceph::user_management"

puts "This is CEPH - clustername is #{node[:ceph][:clustername]}"

apt_repository "ceph" do
  uri "http://ceph.newdream.net/debian/"
  distribution node['lsb']['codename'] 
  components ["main"]
  key "https://raw.github.com/ceph/ceph/master/keys/release.asc"
  action :add
end

apt_repository "ceph-autobuild-master" do
  uri "http://ceph.newdream.net/debian-snapshot-amd64/master"
  distribution node['lsb']['codename'] 
  components ["main"]
  key "https://raw.github.com/ceph/ceph/master/keys/autobuild.asc"
  action :add
end

package "ceph"
package "ceph-common"

ceph_config "Default ceph config" do
  action :create
end