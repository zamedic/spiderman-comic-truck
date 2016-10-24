execute 'npm install' do
  cwd node['delivery']['workspace']['repo']
end

include_recipe 'spiderman-comic-truck:unit-jasmin' if node["spiderman-commic-truck"]["unit"]["jasmin"]

