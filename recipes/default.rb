include_recipe 'delivery-truck::default'
include_recipe 'nodejs::default'

execute "npm set registry http://npmjs.standardbank.co.za"
