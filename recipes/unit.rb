include_recipe 'nodejs::default'

execute 'npm install' do
  cwd @new_resource.cwd
end

execute 'jasmine' do
  cwd @new_resource.cwd"/test/jasmine"
end