require 'chef/mixin/shell_out'
require 'json'

module SpidermanCommicTruck
  module Helpers
    module Syntax
      include Chef::Mixin::ShellOut
      extend self

      def bumped_npm_version?(path, node)
        return true if node['delivery']['change']['stage'] == 'build'
        change = DeliverySugar::Change.new(node)
        ref_old = "origin/#{change.pipeline}"
        ref_new = "origin/#{change.patchset_branch}"
        old_version, new_version = [ref_old, ref_new].map do |ref|
          package = shell_out!("git show #{ref}:package.json", cwd: change.workspace_repo).stdout.chomp
          Chef::Log.info "Package Value: #{package}"
          packageJson = JSON.parse(package)
          Chef::Log.info "Package Json: #{package}"
          packageJson[1].value
        end
        Gem::Version.new(old_version) < Gem::Version.new(new_version)
      end
    end
  end

  module DSL

    def bumped_npm_version?(path)
      SpidermanCommicTruck::Helpers::Syntax.bumped_npm_version?(path, node)
    end
  end
end
