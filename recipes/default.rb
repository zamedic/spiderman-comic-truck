include_recipe 'delivery-truck::default'
include_recipe 'nodejs::default'

execute "npm config set proxy http://c1592023:trendweb@websenseproxy.standardbank.co.za:8080 --global"
execute "npm set registry  --global"
