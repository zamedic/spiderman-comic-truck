nodejs_npm 'jasmin'

execute 'jasmin' do
  cwd "#{node['delivery']['workspace']['repo']}/#{node["spiderman-commic-truck"]["unit"]["jasmin"]["path"]}"
end