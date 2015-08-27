Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

	    resources :items do
	    	resources :offers
	    	resources :comments
	    end
	    resources :bookmarks
	    resources :ratings
	resources :schools

  root 'static_pages#index'

  get '/swap' => 'items#swap'
  get '/myItems' => 'items#myItems'
  get '/myItemsToSwap' => 'items#myItemsToSwap'
  get '/offersToYou' => 'offers#offersToYou'
  get '/offersByYou' => 'offers#offersByYou'
  get '/offersAccepted' => 'offers#offersAccepted'
  get '/offersRejected' => 'offers#offersRejected'

end
