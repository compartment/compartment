# ContentAreas are not persisted on the server, so this model is only used on the client side.
class Compartment.Models.ContentArea extends Backbone.Model
  # urlRoot: '/admin/content_area'

  constructor: (data, options)->
    @content_blocks = new Compartment.Collections.ContentBlocks
    super(data, options)

  parse: (data, options)->
    @content_blocks.reset(data.content_blocks)
    delete data.content_blocks
    data