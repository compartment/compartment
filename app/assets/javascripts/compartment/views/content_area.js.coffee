class Compartment.Views.ContentArea extends Backbone.View

  events:
    'click .compartment_content_area_add_content_button': 'displayNewContentBlockModal'
    'mouseenter .compartment_content_block_placeholder': 'showPlaceholderActions'
    'mouseleave .compartment_content_block_placeholder': 'hidePlaceholderActions'

  initialize: (options)->
    @content_blocks = @model.content_blocks
    @listenTo @content_blocks, 'add', @addOne
    @prepareNewContentBlockModal()
    @$placeholder = @$el.find('.compartment_content_block_placeholder')

  render: ->
    @content_blocks.each(@addAll, @)
    if @$placeholder.length
      @$placeholder.append JST['compartment/content_blocks/actions']()
    if @model.get('limit') != 1 or (@content_blocks.length == 0 and @$placeholder.length == 0)
      @$el.append JST['compartment/add_content_button']()
    @

  addAll: (content_block) ->
    view = new Compartment.Views.ContentBlock(model: content_block)
    @$el.append view.render().el

  addOne: (content_block) ->
    view = new Compartment.Views.ContentBlock(model: content_block)
    @$el.find('.compartment_content_area_add_content_button').before view.render().el
    view.edit()

  prepareNewContentBlockModal: ->
    content_block_types = new Compartment.Collections.ContentBlockTypes(Compartment.Data.content_block_types)
    @modal = new Compartment.Views.NewContentBlockModal(content_block_types: content_block_types)
    @listenTo @modal, 'selected', @createNewContentBlock
    @modal.render()

  # correctPlaceholderStyles: ->
  #   $first_child = @$placeholder.find('> *')
  #   @$placeholder.css
  #     width: $first_child.width()
  #     height: $first_child.height()

  # for content areas that only allow one content block
  hidePlaceholderActions: -> @$placeholder.find('.actions').hide()
  showPlaceholderActions: ->
    $first_child = @$placeholder.find('> *')
    @$placeholder.find('.actions').css(
      width: $first_child.outerWidth()
      height: $first_child.outerHeight()
      # top: $first_child.css('top')
      top: $first_child[0].offsetTop
      # right: $first_child.css('right')
      # bottom: $first_child.css('bottom')
      # left: $first_child.css('left')
      left: $first_child[0].offsetLeft
    ).show()

  displayNewContentBlockModal: (event)->
    event.preventDefault()
    @modal.display()

  createNewContentBlock: (type)->
    @content_blocks.add(type: type, content_area: @model.get('name'))