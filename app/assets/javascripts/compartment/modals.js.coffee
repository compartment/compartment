# Based on Lean Modal by FinelySliced: http://leanmodal.finelysliced.com.au/

# $ = jQuery

# $.fn.extend

#   compartmentModal: (options)->

#     defaults =
#       top: 100
#       overlay: 0.5
#       closeButton: null

#     options = $.extend defaults, options

#     overlay = $('<div id="compartment_modal_overlay"></div>')
#     $('body').append(overlay)

#     close_modal = (modal_id)->
#       $("#compartment_modal_overlay").fadeOut(200)
#       $(modal_id).css(display: 'none')

#     return @each ->

#       o = options
#       $(@).click (e)->
      
#         modal_id = $(@).attr('href')

#         $('#compartment_modal_overlay').click -> close_modal(modal_id)
#         $(o.closeButton).click -> close_modal(modal_id)

#         modal_height = $(modal_id).outerHeight()
#         modal_width = $(modal_id).outerWidth()

#         $('#compartment_modal_overlay').css(display: 'block', opacity: 0)
#         $('#compartment_modal_overlay').fadeTo 200, o.overlay

#         $(modal_id).css
#           display: 'block'
#           position: 'fixed'
#           opacity: 0
#           zIndex: 11000
#           left: 50 + '%'
#           marginLeft: -(modal_width/2) + "px"
#           top: o.top + "px"

#         $(modal_id).fadeTo 200, 1
#         e.preventDefault()
