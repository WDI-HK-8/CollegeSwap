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
    get '/items' => 'get#items'
    get '/items{item_id}' => 'get#items'
    get 'items/search?query={query}' => 'get#items'
    get 'items/swap?price={price}' => 'get#items'
    get '/user/{id}/items' => 'get#items'
    get '/items/{item_id}/offers/{offer_id}' => 'get#'

    post '/signup' => 'post#users'


    put '/items/{item_id}' => 'items#update'
    put '/profile' => 'items#update' 
    put '/items/{item_id}/offers/{offer_id}/accepted' =>'items#update'

    post '/delete' => 'delete#destroy'
    post '/items' => 'posts#items'
    post '/items/{item_id}' => 'posts#items'

    
    delete 'items/{item_id}' => 'items#destroy'
    delete 'items/{item_id}/offers/{offer_id}/accepted'


end
