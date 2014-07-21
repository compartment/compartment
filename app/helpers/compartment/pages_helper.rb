module Compartment
  module PagesHelper

    def theme_stylesheet_url(file)
      @page.site.theme.asset_path("stylesheets/#{file}")
    end

    # renders the stylesheet link tags appropriate for the current page
    def styles
      stylesheet_link_tag 'compartment/frontend-styles' if admin_logged_in?
      # render the theme styles
    end

    # TODO: refactor this. Don't generate strings of json.
    def scripts
      scripts = []
      if admin_logged_in?
        # scripts << "<script>window.current_page_id = '#{@page.id}';</script>" unless @page.nil?
        scripts << javascript_include_tag('compartment/application')
        unless @page.nil?
          html = '<script type="text/javascript">'
          html +=   "Compartment.Data.current_page = #{@page.to_json(include: :content_blocks)};\n"
          html +=   "Compartment.Data.content_block_types = [];\n"
          Compartment.config.content_block_types.each_with_index do |block, i|
            html +=   "Compartment.Data.content_block_types[#{i}] = #{block.to_json};\n"
          end
          html += "</script>"
          scripts << html
        end
      end
      raw scripts.join("\n")
    end

    # returns the title of the current page
    def page_title
      @page.title
    end

    # renders the content for the specified content area
    def content_area(name, options = {}, &placeholder)
      options = { wrapper_tag: :div }.merge(options)
      options.merge!(placeholder: capture(&placeholder)) if block_given?
      html = ''
      content_blocks = @page.content_blocks.where(content_area: name).limit(options[:limit])
      content_blocks.each do |block|
        block_html = block.render.html_safe
        if admin_logged_in?
          # Don't need to render anything. The javascript will take care of this.
        else
          html += block_html
        end
      end
      if html == '' and options[:placeholder]
        if admin_logged_in?
          html = content_tag options[:wrapper_tag], options[:placeholder], class: 'compartment_content_block_placeholder'
        else
          html = options[:placeholder]
        end
      end
      data_attributes = {name: name}
      data_attributes[:limit] = options[:limit] if options[:limit]
      html = content_tag options[:wrapper_tag], html.html_safe, :class => 'compartment_content_area', data: data_attributes if admin_logged_in?
      html.html_safe
    end

    # old functionality
    # def content_block(name, options = nil)
    #   options = { limit: 1 }.merge(options)
    #   content_area name, options
    # end

    def editable_text(name, options = {}, &placeholder)
      options = { type: :text }.merge(options)
      options.merge!(limit: 1, wrapper_tag: :span) # enforce only 1
      content_area(name, options, &placeholder)

      # block = @page.content_blocks.where(content_area: name).first

      # html = block.render if block
      # html ||= options[:placeholder] ||= ''

      # html = content_tag :span, html.html_safe, :class => 'compartment_content_area', data: { name: name } if admin_logged_in?
      # html.html_safe
    end

    # In a theme, using content_block is the same as a content area that only allows one content block.
    def content_block(name, options = {}, &placeholder)
      options.merge!(limit: 1) # enforce only 1
      content_area(name, options, &placeholder)
    end

  end
end
