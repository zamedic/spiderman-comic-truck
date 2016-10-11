include_recipe 'nodejs::default'

execute 'npm install'
execute 'jasmine'