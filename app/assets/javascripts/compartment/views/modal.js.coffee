class Compartment.Views.Modal extends Backbone.View

  className: 'compartment_modal'

  $overlay: -> $('#compartment_modal_overlay')

  initialize: ->
    # _.bindAll(@) # TODO: REVIEW
    # make sure only one instance of the overlay has been added to the DOM
    $('<div id="compartment_modal_overlay"></div>').appendTo('body') unless @$overlay().length > 0
    @$overlay().on 'click', @hide

  render: ->
    @$el.hide()
    @$el.html @template(@templateData())
    @$el.appendTo 'body'
    @

  templateData: -> {}

  display: -> @show()

  show: ->
    modal_width = @$el.outerWidth()

    @$overlay().css(display: 'block', opacity: 0)
    @$overlay().fadeTo 200, 0.5

    @$el.css
      display: 'block'
      position: 'fixed'
      opacity: 0
      zIndex: 11000
      left: '50%'
      marginLeft: -(modal_width/2) + 'px'
      top: '100px'

    @$el.fadeTo 200, 1

  hide: ->
    $("#compartment_modal_overlay").fadeOut(200)
    @$el.css(display: 'none')