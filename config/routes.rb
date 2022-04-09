Rails.application.routes.draw do

devise_for :customer, controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
}

  namespace :public do
   root to: 'homes#top'
   resources :items, only: [:index, :show]
   resources :cart_items do
     collection do
       delete 'destroy_all'
      end
     end
   get 'orders/verification' => 'orders#verification',as: 'verification'
   get 'orders/thanks' => 'orders#thanks', as: 'thanks'
   resources :orders, only: [:new, :create ,:index, :show]
   resources :addresses
   resources :customers, only: [:show,:edit]
   patch "customers/:id/edit" => 'customers#update'
   patch "cart_items/:id/edit" => 'cart_items#update'
   get 'customers/:id/verfication' => 'customers#verfication', as: 'verfication'
   patch 'customers/:id/withdrawal' => 'customers#withdrawal', as:'withdrawal'
  end


  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
   root to: 'homes#top'
   resources :items
   resources :genres
   resources :customers
   resources :orders
   resources :order_details
   patch "genres/:id/edit" => 'genres#update'
   patch "items/:id/edit" => 'items#update'
   patch "customers/:id/edit" => 'customers#update'
  end


  get "about" => 'public/homes#about'
end
