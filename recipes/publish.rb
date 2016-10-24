execute 'npm install' do
  cwd node['delivery']['workspace']['repo']
end

include_recipe "spiderman-comic-truck::publish-bower"
include_recipe "spiderman-comic-truck::publish-grunt"

include_recipe 'delivery-truck::publish'



