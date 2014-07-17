class Compartment.Views.Page extends Backbone.View

  initialize: (options)->
    @page_toolbar = new Compartment.Views.PageToolbar

  render: ->
    @page_toolbar.render().$el.appendTo('body')
    @render_content_areas()

  render_content_areas: ->
    page = @model
    $('.compartment_content_area').each (i, el)->
      content_area = page.newContentArea($(el).data())
      view = new Compartment.Views.ContentArea el: el, model: content_area
      view.render()
    @