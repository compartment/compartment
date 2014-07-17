class Compartment.Routers.Default extends Backbone.Router
	routes:
		'admin/*path': 'admin'
		'*path': 'page'

	admin: (path) ->
		# nothing yet

	page: (path) ->
		data = Compartment.Data.current_page
		page = new Compartment.Models.Page(data, parse: true)
		Compartment.current_page = page
		view = new Compartment.Views.Page(model: page)
		view.render()
