Compartment::Engine.routes.draw do
  scope :admin do
    resources :pages
    resources :sites
    # match '*', :to => 'pages#show'
  end
  match '*url_path', :to => 'pages#show'
  root :to => 'pages#show'
end
