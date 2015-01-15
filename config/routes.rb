Rails.application.routes.draw do

  resources :vendors do
    resources :comments, only: [:show, :create, :destroy]
  end
  
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks"}
  resources :users, only: [:show, :index, :update]


  resources :products, :path => "brands" do
    resources :comments, only: [:show, :create, :destroy]
     resources :follows, only: [:create, :destroy]
  end

  root 'products#index'

end

