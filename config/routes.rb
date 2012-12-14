Compartment::Engine.routes.draw do
  scope :admin do
    resources :pages
    resources :sites
  end
  match '*all', :to => 'pages#show'
  root :to => 'pages#show'
end
