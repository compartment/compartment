class Compartment.Views.ContentBlock extends Backbone.View

  className: 'compartment_content_block'

  showTemplate: JST['compartment/content_blocks/show']
  editTemplate: JST['compartment/content_blocks/edit']

  render: ->
    @render_show()
    @

  events:
    'mouseenter': 'display_actions'
    'mouseleave': 'hide_actions'
    'click .edit': 'render_edit'
    'click .save': 'save'
    'click .cancel': 'cancel'
    'click .delete': 'confirm_delete'

  display_actions: -> @$el.find('.actions').show()
  hide_actions:    -> @$el.find('.actions').hide() unless @editing

  render_show: ->
    @editing = false
    @$el.removeClass 'editing'
    @$el.html @showTemplate(content_block: @model)

  render_edit: ->
    @editing = true
    @$el.addClass 'editing'
    @$el.html @editTemplate(content_block: @model)

  edit: ->
    @render_edit()
    
  save: ->
    @model.set 'data', @$el.find('textarea').val()
    @model.save null,
      success: =>
        @render_show()
      error: (arg1, arg2)->
        console.log 'error:', arg1, arg2

  cancel: ->
    if @model.isNew()
      @remove()
    else
      @render_show()
    
  confirm_delete: ->
    if confirm 'Are you sure you want to delete this content?'
      @model.destroy
        success: (model, response) =>
          @$el.animate opacity: 0, 500, =>
            @$el.slideUp =>
              @$el.remove()
              @remove()
        error: (arg1, arg2)->
          console.log 'error:', arg1, arg2


