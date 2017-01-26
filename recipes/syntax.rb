include_recipe 'delivery-truck::syntax'

unless ::File.exist?("#{node['delivery']['workspace']['repo']}/package.json")
  raise RuntimeError, "This delivery is meant to build npm based applications. I cannot find a package.json so I need to abort the build"
end

if (application_changes?(changed_files))

  unless bumped_npm_version?(node['delivery']['workspace']['repo'])
    raise RuntimeError, "Artifact version unchanged from parent - you have to increase the version in the package.json file"
  end

end


