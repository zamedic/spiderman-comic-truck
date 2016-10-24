
execute 'npm install' do
  cwd node['delivery']['workspace']['repo']
end

execute 'jasmin' do
  cwd "#{node['delivery']['workspace']['repo']}/#{node["spiderman-commic-truck"]["unit"]["jasmin"]}"
  only_if {node["spiderman-commic-truck"]["unit"]["jasmine"] != nil}
end