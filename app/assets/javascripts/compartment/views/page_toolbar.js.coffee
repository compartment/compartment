class Compartment.Views.PageToolbar extends Backbone.View

  template: JST['compartment/page_toolbar']

  id: 'compartment_toolbar'

  events:
    'click #new_compartment_page': 'displayNewPageModal'

  initialize: ->
    @new_page_modal = new Compartment.Views.NewPageModal
    @new_page_modal.render()

  render: ->
    @$el.html @template()
    @

  displayNewPageModal: ->
    @new_page_modal.show()