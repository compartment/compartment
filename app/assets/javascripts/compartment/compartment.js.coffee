window.Compartment =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  Data: {}
  initialize: -> 
    new Compartment.Routers.Default
    Backbone.history.start(pushState: true)

$(document).ready ->
  Compartment.initialize()
