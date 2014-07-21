Compartment::Engine.routes.draw do

  namespace :admin, :constraints => { :protocol => :ssl } do

    get 'setup' => 'setup_wizard#new', as: :setup_wizard
    post 'setup' => 'setup_wizard#create'

    root :to => 'dashboard#index'
    get 'login' => 'sessions#new', as: :login
    post 'login' => 'sessions#create'
    get 'logout' => 'sessions#destroy', as: :logout
    get 'account' => 'account#show', as: :account
    get 'dashboard' => "dashboard#index", as: :dashboard
    get 'settings' => "settings#index", as: :settings
    resources :users
    resources :pages do
      resources :content_areas
      resources :content_blocks
    end
    resources :content_block_types, only: :index
    resources :themes
  end

  get 'assets/themes/:theme_name/*file.:ext' => 'theme_assets#send_asset'
  match '*all', :to => 'pages#show', as: :page
  root :to => 'pages#show'
end
