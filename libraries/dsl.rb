require_relative 'npm_verion'
require_relative 'helpers_publish'


Chef::Recipe.send(:include, SpidermanCommicTruck::DSL)
Chef::Resource.send(:include, SpidermanCommicTruck::DSL)
Chef::Provider.send(:include, SpidermanCommicTruck::DSL)
