include_recipe 'delivery-truck::default'
include_recipe 'nodejs::default'

#Set Proxy if specified
execute "npm config set proxy #{node["spiderman-commic-truck"]["proxy"]} --global" do
  only_if {node["spiderman-commic-truck"]["proxy"] != nil}
end

#Ensure no proxy is set if one is not specified
execute "npm config remove proxy" do
  not_if {node["spiderman-commic-truck"]["proxy"] == nil}
end

#Set a Registry if one is specifed
execute "npm set registry #{node["spiderman-commic-truck"]["registry"]}" do
  only_if {node["spiderman-commic-truck"]["registry"] != nil}
end

#If No Registry is specified - ensure the default value is set
execute "npm config delete registry" do
  only_if {node["spiderman-commic-truck"]["registry"] == nil}
end
