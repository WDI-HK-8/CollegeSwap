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
  match '/items', to: 'pages#items', via: :post
    
    get '/' => 'static_pages#index'
    get '/items' => 'items#get'
    get '/items{item_id}' => 'items#get'
    get 'items/search?query={query}' => 'items#get'
    get 'items/swap?price={price}' => 'items#get'
    get '/user/{id}/items' => 'items#get'
    get '/items/{item_id}/offers/{offer_id}' => 'offers#get'

    post '/signup' => 'post#users'


    put '/items/{item_id}' => 'items#update'
    put '/profile' => 'items#update' 
    put '/items/{item_id}/offers/{offer_id}/accepted' =>'items#update'

    post '/items' => 'items#show'
    post '/items/{item_id}' => 'items#show'

    
    delete 'items/{item_id}' => 'items#destroy'
    delete 'items/{item_id}/offers/{offer_id}/accepted' => 'offers#destroy'


end
