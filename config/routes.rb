Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

	    resources :items do
	    	resources :offers
	    	resources :comments
	    end
	    resources :bookmarks
	    resources :ratings


  root 'static_pages#index'

end
