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

execute "npm set registry #{registry}" do
  cwd node['delivery']['workspace']['repo']
end

bash 'setup username and password' do
  cwd ::File.dirname('/usr/local/bin')
  code <<-EOF
/usr/bin/expect -c 'spawn npm adduser
expect "Username: "
send "#{node["spiderman-comic-truck"]["deploy"]["user"]}\r"
expect "Password: "
send "#{node["spiderman-comic-truck"]["deploy"]["password"]}\r"
expect "Email: (this IS public) "
send "#{node["spiderman-comic-truck"]["deploy"]["email"]}\r"
'
  EOF
  environment "HOME" => "/tmp"
end


execute "npm publish" do
  cwd node['delivery']['workspace']['repo']
  environment "HOME" => "/tmp"
end


include_recipe 'delivery-truck::publish'
