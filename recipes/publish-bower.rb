execute "#{node['delivery']['workspace']['repo']}/node_modules/.bin/bower install > #{node['delivery']['workspace']['repo']}/bower.log" do
  cwd "#{node['delivery']['workspace']['repo']}/"
end