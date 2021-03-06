Rails.application.routes.draw do
  devise_for :users, controllers: { 

    passwords: 'users/passwords',
   registrations: 'users/registrations',   
    sessions: 'users/sessions' }
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'welcome#index'

mount RuCaptcha::Engine => "/rucaptcha"

namespace :admin do
  resources :products
    resources :orders do
        member do
            post :cancel
            post :ship
            post :shipped
            post :return
        end
    end
end

resources :products do
  resources :comments 
    member do
      post :add_to_cart
      post :collect
    end
    collection do
      get :search
      get :bgs
      get :kt
      get :cc
      get :ws
      get :zmhdzcp
      get :pj
    end
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

    resources :cart_items do
      member do
        post :remove_quantity
        post :add_quantity
      end
    end
    
    resources :orders do
      member do
        post :pay_with_alipay
        post :pay_with_wechat
            post :apply_to_cancel
      end
    end


    namespace :account do
      resources :orders
    end
   resources :collections

   resources :welcome do
    collection do
      get :shopping_directory
    end
  end

  get 'shopping_directory' => 'welcome#shopping_directory'
  get 'contact_us' => 'welcome#contact_us'
end
