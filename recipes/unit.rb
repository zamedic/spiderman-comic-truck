
execute 'npm install' do
  cwd node['delivery']['workspace']['repo']
end

execute 'jasmine' do
  cwd "#{node['delivery']['workspace']['repo']}/#{node["spiderman-commic-truck"]["unit"]["jasmine"]}"
  only_if {node["spiderman-commic-truck"]["unit"]["jasmine"] != nil}
end