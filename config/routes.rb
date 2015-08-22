Rails.application.routes.draw do

  resources :users do 
    resources :items
  end


  root 'users#index'

  match '/swap', to: 'pages#swap', via: :get
  match '/offer', to: 'pages#offer', via: :get
  match '/bookmark', to: 'pages#bookmark', via: :get
end
