Compartment::Engine.routes.draw do

  namespace :admin, :constraints => { :protocol => :ssl } do
    root :to => 'dashboard#index'
    get 'login' => 'sessions#new', :as => :login
    post 'login' => 'sessions#create'
    get 'logout' => 'sessions#destroy', :as => :logout
    get 'account' => 'account#show', :as => :account
    get 'dashboard' => "dashboard#index", :as => :dashboard
    get 'settings' => "settings#index", :as => :settings
    resources :users
    # resources :sites # this belongs in its own gem
    resources :pages do
      # get 'toolbar'
      resources :content_areas
      resources :content_blocks
    end
    resources :content_block_types, only: :index
    # get 'content_block_types' => 'content_block_types#index', :as => :content_block_types
  end

  get 'assets/themes/:theme_name/*file.:ext' => 'theme_assets#send_asset'
  match '*all', :to => 'pages#show', :as => :page
  root :to => 'pages#show'
end
