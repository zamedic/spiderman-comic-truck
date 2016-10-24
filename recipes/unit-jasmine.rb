execute "npn install -g jasmine"

execute "jasmine" do
  cwd "#{node['delivery']['workspace']['repo']}/#{node["spiderman-comic-truck"]["unit"]["jasmine"]["path"]}"
end