module Compartment
  class Theme < ActiveRecord::Base

    # used for registering a theme
    def self.info
      info = Struct.new(:name, :author).new
      yield(info)
      Compartment.config.registered_themes << info
    end

    belongs_to :site
    attr_accessible :name

    validates_presence_of :name

    def self.default
      Theme.new(:name => 'default')
    end

    def filepath
      File.join(Compartment.config.themes_path, name)
    end

    def path_to_template(template)
      case template
      when :page_not_found, 404
        template = 'error_404'
      end
      File.join(filepath, 'templates', template)
    end
    
    def url
      "/assets/themes/#{name}/"
    end

    def url_to_file(name)
      url + name
    end

  end
end
