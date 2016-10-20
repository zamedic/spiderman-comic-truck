require 'chef/mixin/shell_out'
require 'json'

module SpidermanCommicTruck
  module Helpers
    module Syntax
      include Chef::Mixin::ShellOut
      extend self

      def bumped_pom_version?(path, node)
        return true if node['delivery']['change']['stage'] == 'build'
        change = DeliverySugar::Change.new(node)
        ref_old = "origin/#{change.pipeline}"
        ref_new = "origin/#{change.patchset_branch}"
        old_version, new_version = [ref_old, ref_new].map do |ref|
          package = shell_out!("git show #{ref}:package.json", cwd: change.workspace_repo).stdout.chomp
          packageJson = JSON.parse(package)
          packageJson[1].value
        end
        Gem::Version.new(old_version) < Gem::Version.new(new_version)
      end
    end
  end

  module DSL

    def bumped_pom_version?(path)
      CoffeeTruck::Helpers::Syntax.bumped_pom_version?(path, node)
    end
  end
end
