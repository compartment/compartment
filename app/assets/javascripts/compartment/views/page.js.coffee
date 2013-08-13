class Compartment.Views.Page extends Backbone.View

  initialize: (options)->
    @page_toolbar = new Compartment.Views.PageToolbar(page: @model)

  render: ->
    @page_toolbar.render().$el.appendTo('body')

    page = @model
    $('.compartment_content_area').each (i, el)->
      content_area = page.newContentArea($(el).data())
      view = new Compartment.Views.ContentArea el: el, model: content_area
      view.render()
    @