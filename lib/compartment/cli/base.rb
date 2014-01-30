require "thor"
require "thor/group"
require_relative "new"

module Compartment
  module CLI
    class Base < Thor
      include Thor::Actions

      def self.source_root
        File.dirname(__FILE__)
      end

      desc "new NAME", "Creates a new Compartment application inside a directory with the given name"
      def new(name)
        directory 'new_app_template', name
      end

      # desc 'new <name>', 'Create a new Compartment application.'
      # subcommand 'new', New

      # desc "resources TASK ...", "Tools for managing resources directory"
      # subcommand 'create', Create # only register if actually in project directory
      # register(CreateSite, 'create site', 'create site <domain>', 'Create site command.')
      # register(CreatePage, 'create page', 'create page <url path>', 'Create page command.')
    end
  end
end
