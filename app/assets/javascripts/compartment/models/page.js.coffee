class Compartment.Models.Page extends Backbone.Model

  urlRoot: '/admin/pages'

  # defaults:
  #   content_blocks: []

  # initialize: (options)->
  #   @content_blocks = new Compartment.Collections.ContentBlocks([], page: @)

  constructor: (data, options)->
    console.log 'in Page constructor', @
    @content_blocks = new Compartment.Collections.ContentBlocks([], page: @)
    super(data, options)

  parse: (data, options)->
    @content_blocks.reset(data.content_blocks)
    delete data.content_blocks
    data

  newContentArea: (data)->
    data.page_id = @get('id')
    data.content_blocks = @content_blocks.where(content_area: data.name)
    new Compartment.Models.ContentArea(data, page: @, parse: true)

  initialize: ->
    @content_blocks.page = @
  #   console.log 'initialize page', @
    # @content_blocks = new Compartment.Collections.ContentBlocks
    #   @content_blocks = new Compartment.Collections.ContentBlocks(@get('content_blocks'))

  # Content Areas are created dynamically based on the names given in the theme template
  # content_area_by_name: (name)->
  #   @content_blocks.page = @
  #   content_area = new Compartment.Models.ContentArea
  #     name: name
  #     # page_id: @get('id')
  #     page: @
  #     content_blocks: @content_blocks
  #   content_area