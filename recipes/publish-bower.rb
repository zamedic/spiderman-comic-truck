execute "#{node['delivery']['workspace']['repo']}/node_modules/.bin/bower" do
  cwd "#{node['delivery']['workspace']['repo']}/"
end