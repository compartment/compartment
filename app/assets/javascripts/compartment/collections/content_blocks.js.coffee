class Compartment.Collections.ContentBlocks extends Backbone.Collection

  model: Compartment.Models.ContentBlock

  # initialize: (options)->
  #   @page = options.page

  constructor: (data, options)->
    console.log 'in ContentBlocks constructor', @, data, options
    @page = options.page
    super(data, options)

  url: -> 
    console.log 'page', @page
    @page.url() + '/content_blocks'
