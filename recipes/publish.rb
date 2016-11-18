include_recipe 'spiderman-comic-truck::npm-registry'

execute 'npm install' do
  cwd node['delivery']['workspace']['repo']
end

bower = ::File.exist?("#{node['delivery']['workspace']['repo']}/bower.json")
include_recipe "spiderman-comic-truck::publish-bower" if bower

grunt = ::File.exist?("#{node['delivery']['workspace']['repo']}/Gruntfile.js")
include_recipe "spiderman-comic-truck::publish-grunt" if grunt


if (node["spiderman-comic-truck"]["deploy"]["registry"] == nil)
  registry = node["spiderman-comic-truck"]["registry"]
else
  registry = node["spiderman-comic-truck"]["deploy"]["registry"]
end

file "#{node['delivery']['workspace']['repo']}/.npmrc" do
  content ''
  mode '0600'
  action :create_if_missing
end

ruby_block "insert_line" do
  block do
    tmp_repo = registry.sub("http://",'')
    file = Chef::Util::FileEdit.new("#{node['delivery']['workspace']['repo']}/.npmrc")
    file.insert_line_if_no_match("//#{tmp_repo}:_authToken=#{node["spiderman-comic-truck"]["deploy"]["auth-token"]}","//#{tmp_repo}:_authToken=#{node["spiderman-comic-truck"]["deploy"]["auth-token"]}")
    file.write_file
  end
end

execute "npm set registry #{registry}" do
  cwd node['delivery']['workspace']['repo']
end

execute "npm publish" do
  cwd node['delivery']['workspace']['repo']
end


ruby_block "update version" do
  block do
    packageJson = json::JSON.parse("#{node['delivery']['workspace']['repo']}/package.json")
    version_number = packageJson["version"]
    SpidermanCommicTruck::Helpers::Publish::define_project_application(node['delivery']['change']['project'], version_number, Hash.new)
    SpidermanCommicTruck::Helpers::Publish::sync_envs(node)
  end
end



include_recipe 'delivery-truck::publish'
