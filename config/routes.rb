Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  
  #API Rest 
  namespace :api do
    namespace :v1 do
      resources :store
      resources :products
      resources :store_product
      resources :order
    end
  end
end
