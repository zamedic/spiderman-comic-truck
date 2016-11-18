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
          packageJson = JSON.parse(package)
          Chef::Log.warn "Version: #{packageJson["version"]}"
          packageJson["version"]
        end
        Gem::Version.new(old_version) < Gem::Version.new(new_version)
      end
    end
  end

  module DSL

    def bumped_npm_version?(path)
      SpidermanCommicTruck::Helpers::Syntax.bumped_npm_version?(path, node)
    end

    def update_version()
      define_project_application(node['delivery']['change']['project'], version_number, Hash.new)
      sync_envs(node)
    end

    private

    def version_number
      cwd =  node['delivery']['workspace']['repo'] q
      path = "#{cwd}/package.json"
      doc = ::File.read(path) { |f|  JSON.parse(f) }
      doc["version"]
    end

  end
end
