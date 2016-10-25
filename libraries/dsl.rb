require_relative 'npm_verion'


Chef::Recipe.send(:include, SpidermanCommicTruck::DSL)
Chef::Resource.send(:include, SpidermanCommicTruck::DSL)
Chef::Provider.send(:include, SpidermanCommicTruck::DSL)
