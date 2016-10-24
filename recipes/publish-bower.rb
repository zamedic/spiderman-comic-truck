execute "#{node['delivery']['workspace']['repo']}/node_modules/.bin/bower install" do
  cwd "#{node['delivery']['workspace']['repo']}/"
end