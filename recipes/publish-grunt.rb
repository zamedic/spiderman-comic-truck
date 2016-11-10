execute "#{node['delivery']['workspace']['repo']}/node_modules/.bin/grunt build > #{node['delivery']['workspace']['repo']}/grunt.log" do
  cwd "#{node['delivery']['workspace']['repo']}/"
end