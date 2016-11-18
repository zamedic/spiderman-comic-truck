include_recipe 'spiderman-comic-truck::npm-registry'

execute 'npm install' do
  cwd node['delivery']['workspace']['repo']
end

include_recipe 'spiderman-comic-truck::unit-jasmine' if node["spiderman-comic-truck"]["unit"]["jasmine"]["active"] == "true"

