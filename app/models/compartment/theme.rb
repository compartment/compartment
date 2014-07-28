module Compartment
  class Theme #< ActiveRecord::Base

    attr_accessor :name, :author
    attr_reader :base_path

    def initialize(attrs = {})
      @base_path = File.dirname(caller[0]) # NOTE: This assumes that the caller was theme.rb
      attrs.each do |key, value|
        self.send "#{key}=", value
      end
      yield(self) if block_given?
      if name.present?
        Compartment.registered_themes[name] = self # TODO: validate uniqueness of theme name
      else
        Compartment.logger.error('Invalid theme definition. Missing theme name.')
      end
    end

    # used for registering a theme
    # def self.info
    #   info = Struct.new(:name, :author).new
    #   yield(info)
    #   Compartment.config.registered_themes << info
    # end

    def self.default
      # Theme.new(name: 'default')
      Compartment.registered_themes['Compartment Default']
    end

    def self.find_by_name(name)
      Compartment.registered_themes[name]
    end

    # def filepath
    #   File.join(Compartment.config.themes_path, name)
    # end

    def template_path(template)
      case template
      when :page_not_found, 404
        template = 'error_404'
      end
      File.join(base_path, 'templates', template)
    end
    
    # Returns the URL path. Does not validate the existence of the file.
    def asset_path(file)
      "/assets/themes/#{name}/#{file}"
    end

    # Returns the file path. Does not validate the existence of the file.
    def asset_filepath(file)
      File.join(base_path, file)
    end

    # def url_to_file(name)
    #   url + name
    # end

    def templates
      templates = []
      # TODO: maybe create an actual class for this
      template = Struct.new(:name, :filename)
      Dir.new(File.join(base_path, 'templates')).each do |file|
        unless %w(. ..).include?(file) or file =~ /error_/
          # TODO: maybe parse name/description/icon from YAML front-matter
          filename = file.split('.').first
          name = filename.titleize
          templates << template.new(name, filename)
        end
      end
      templates
    end

  end
end
