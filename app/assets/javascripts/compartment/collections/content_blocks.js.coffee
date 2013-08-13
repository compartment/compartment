class Compartment.Collections.ContentBlocks extends Backbone.Collection

  model: Compartment.Models.ContentBlock

  # constructor: (data, options)->
  #   @page = options.page
  #   super(data, options)

  url: -> 
    console.log @page
    # @page.url() + '/content_blocks'
    'hello'
