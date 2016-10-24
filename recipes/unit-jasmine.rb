execute "#{node['delivery']['workspace']['repo']}/node_modules/.bin/jasmine" do
  cwd "#{node['delivery']['workspace']['repo']}/#{node["spiderman-comic-truck"]["unit"]["jasmine"]["path"]}"
end