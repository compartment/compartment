module Compartment
  module PagesHelper

    # returns the title of the current page
    def page_title
      @page.title
    end

    # renders the content for the specified content area
    def content_area(name)
      content_area = @page.content_areas.find_by_name(name)
      content_area.render if content_area
    end

  end
end
