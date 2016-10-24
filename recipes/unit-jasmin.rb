nodejs_npm 'jasmine'

execute 'jasmine' do
  cwd "#{node['delivery']['workspace']['repo']}/#{node["spiderman-commic-truck"]["unit"]["jasmine"]["path"]}"
end