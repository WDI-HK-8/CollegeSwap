Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :schools do
	  resources :users do 
	    resources :items do
	    	resources :offers
	    	resources :comments
	    end
	  end
  end


  root 'static_pages#index'

  match '/swap', to: 'pages#swap', via: :get
  match '/offer', to: 'pages#offer', via: :get
  match '/schools', to: 'pages#schools', via: :get
  match '/comments', to: 'pages#comments', via: :get
  match '/items', to: 'pages#items', via: :get 
end
