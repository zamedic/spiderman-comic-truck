execute 'npm install' do
  cwd node['delivery']['workspace']['repo']
end

bower = ::File.exist?("#{node['delivery']['workspace']['repo']}/bower.json")
include_recipe "spiderman-comic-truck::publish-bower" if bower

grunt = ::File.exist?("#{node['delivery']['workspace']['repo']}/Gruntfile.js")
include_recipe "spiderman-comic-truck::publish-grunt" if grunt

execute 'npm install -g npm-cli-login'

if (node["spiderman-comic-truck"]["deploy_registry"] == nil)
  registry = node["spiderman-comic-truck"]["registry"]
else
  registry = node["spiderman-comic-truck"]["deploy_registry"]
end

execute "npm-cli-login -u #{node["spiderman-comic-truck"]["deploy"]["user"]} -p #{node["spiderman-comic-truck"]["deploy"]["password"]} -e #{node["spiderman-comic-truck"]["deploy"]["email"]} -r #{registry} --scope @#{node["spiderman-comic-truck"]["deploy"]["scope"]}"

execute "npm publish -r #{registry}"

include_recipe 'delivery-truck::publish'



