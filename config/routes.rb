Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :schools do
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

end
