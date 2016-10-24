execute "#{node['delivery']['workspace']['repo']}/node_modules/.bin/grunt install" do
  cwd "#{node['delivery']['workspace']['repo']}/"
end