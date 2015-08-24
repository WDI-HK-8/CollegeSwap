Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :school do
	  resources :users do 
	    resources :items do
	    	resources :offers
	    	resources :comments
	    end
	    resources :bookmarks
	    resources :ratings
	  end
	end


  root 'static_pages#index'

  match '/swap', to: 'pages#swap', via: :get
  match '/offer', to: 'pages#offer', via: :get
  match '/bookmark', to: 'pages#bookmark', via: :get

end
