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
  get '/my_items' => 'items#my_items'
  get '/my_items_to_swap' => 'items#my_items_to_swap'
  get '/offers_to_you' => 'offers#offers_to_you'
  get '/offers_by_you' => 'offers#offers_by_you'
  get '/offers_accepted' => 'offers#offers_accepted'
  get '/offers_rejected' => 'offers#offers_rejected'

end
