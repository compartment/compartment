class Compartment.Views.NewContentBlockModal extends Compartment.Views.Modal

  template: JST['compartment/modals/new_content_block']

  events:
    'click .option': 'optionSelected'

  initialize: (options)->
    super(options)
    @content_block_types = options.content_block_types
    # or fetch them: @content_block_types = new Compartment.Collections.ContentBlockTypes

  templateData: ->
    data = 
      content_block_types: @content_block_types

  optionSelected: (event)->
    event.preventDefault()
    @hide()
    @trigger 'selected', $(event.currentTarget).data('id')
