module Compartment
  module CLI
    class New < Thor
      include Thor::Actions

      source_root File.expand_path('templates', __FILE__)

      desc "new NAME", "Creates a new Compartment application inside a directory with the given name"
      def new(name)
        directory 'app', name
      end

    end
  end
end