execute "#{node['delivery']['workspace']['repo']}/node_modules/.bin/grunt build" do
  cwd "#{node['delivery']['workspace']['repo']}/"
end