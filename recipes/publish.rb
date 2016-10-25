execute 'npm install' do
  cwd node['delivery']['workspace']['repo']
end

bower = ::File.exist?("#{node['delivery']['workspace']['repo']}/bower.json")
include_recipe "spiderman-comic-truck::publish-bower" if bower

grunt = ::File.exist?("#{node['delivery']['workspace']['repo']}/Gruntfile.js")
include_recipe "spiderman-comic-truck::publish-grunt" if grunt

include_recipe 'delivery-truck::publish'



