# require 'spec_helper'

# describe Compartment::PagesController do
#   describe '#show' do

#     # TODO: set env['SERVER_NAME'] for current_site
#     # TODO: how to set request.path_info
    
#     context 'when page does not exist' do
#       it 'renders the current theme 404 page' do
#         get :show
#         response.should render_template("404")
#       end
#     end

#     context 'when page exists' do
#       it 'renders the page' do
#         get :show
#         assigns(:content_block).should eq(content_block)
#       end
#     end

#   end
# end