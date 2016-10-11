
execute 'npm install' do
  cwd node['delivery']['workspace']['repo']
end

execute 'jasmine' do
  cwd "#{node['delivery']['workspace']['repo']}/test/jasmine"
end