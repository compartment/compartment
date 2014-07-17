class Compartment.Models.ContentArea extends Backbone.Model

  # NOTE: ContentAreas are not persisted on the server, so this model is only used on the client side.
  sync: ->
    false

  constructor: (data, options)->
    @page = options.page
    @content_blocks = new Compartment.Collections.ContentBlocks([], page: @page)
    super(data, options)

  parse: (data, options)->
    @content_blocks.reset(data.content_blocks)
    delete data.content_blocks
    data