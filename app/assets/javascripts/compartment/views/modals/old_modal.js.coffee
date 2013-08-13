# class Compartment.Views.OldModal extends Backbone.View

#   # this object serves as a base class for modals used by Compartment

#   className: 'modal hide fade'

#   # el: '#new_page_modal'

#   inParent: -> $('#compartment_toolbar_iframe').length > 0
#   inIframe: -> $('#compartment_toolbar_iframe').length == 0

#   # $iframe: -> @iframe ||= $(window.parent.document).find('#compartment_toolbar_iframe')
#   $iframe: ->
#     if @inParent()
#       $('#compartment_toolbar_iframe')
#     else
#       $(window.parent.document).find('#compartment_toolbar_iframe')

#   iframeWindow: ->
#     raw_iframe = @$iframe()[0]
#     iframe_window = if raw_iframe.contentWindow then raw_iframe.contentWindow else raw_iframe.contentWindow.defaultView
#     return iframe_window

#   $modal: -> $('#compartment_modal')

#   # events:
#   #   'show': 'maximize_iframe'
#   #   'hidden': 'minimize_iframe'
#   #   'keyup #page_title': 'create_url'

#   # create_url: (e)->
#   #   url = '/' + $('#page_title').val().toLowerCase().replace(' ', '-')
#   #   $('#page_url_path').val(url)

#   #todo

#   $modalWrapper: ->
#     # $('#compartment_toolbar_iframe').contents().find('#compartment_modal')
#     $('#compartment_modal')

#   initialize: (options)->
#     # @iframe = Compartment.Views.PageToolbarIframeInstance # if used in parent window

#   render: ->
#     @$modal = $('#compartment_modal')
#     # @$el.html @renderBody()
#     # $('#compartment_toolbar_iframe').contents().find('body').append @$el
#     # @$el.modal(show: false) # initialize
#     @$modal.html @renderBody()
#     # console.log 'original hmtl', html
#     # @$modalWrapper().html html
#     # console.log 'modal: ', @$modalWrapper()
#     @

#   display: ->
#     @maximizeIframe()
#     if @inParent()
#       @iframeWindow().Compartment.displayModal(@modalName)
#     else
#       @render()
#       @$modal.modal('show')
#     @

#   hide: ->
#     @$el.modal('hide')
#     # @$el.fadeOut()
#     # hide modal, hide overlay
#     # @$iframe().minimize()
#     @minimizeIframe()

#   maximizeIframe: (e)-> @$iframe().css 'height', '100%'
#   minimizeIframe: (e)-> @$iframe().css 'height', '42px'
