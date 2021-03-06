#Set Proxy if specified
execute "npm config set proxy #{node["spiderman-comic-truck"]["proxy"]}" do
  only_if {node["spiderman-comic-truck"]["proxy"] != nil}
end

#Ensure no proxy is set if one is not specified
execute "npm config delete proxy" do
  only_if {node["spiderman-comic-truck"]["proxy"] == nil}
  ignore_failure true
end

#Set a Registry if one is specifed
execute "npm set registry #{node["spiderman-comic-truck"]["registry"]}" do
  only_if {node["spiderman-comic-truck"]["registry"] != nil}
end

#If No Registry is specified - ensure the default value is set
execute "npm config delete registry" do
  ignore_failure true
  only_if {node["spiderman-comic-truck"]["registry"] == nil}
end

execute "npm set progress=false"

