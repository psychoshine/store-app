Rails.application.routes.draw do
  

scope '(:locale)', locale: /ua|ru/ do    
    root :to => 'static_pages#main_page'
    resources :shopping_contacts
    resources :cart_items
    
    resources :shopping_carts do
        #resources :contact_infos
        resources :shopping_contacts
        resources :cart_items
        resources :cart_confirms
    end
    resources :shop_items do
        resources :cart_items
    end
    
    resources :contact_us
    resources :contacts, only: [:new, :create, :edit, :update, :index, :destroy]  

    get 'password_resets/new'

    get 'password_resets/edit'

    get 'sessions/new'
    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'
    resources :account_activations, only: [:edit]
    resources :password_resets,     only: [:new, :create, :edit, :update]


    get  '/signup',  to: 'users#new'
    post '/signup',  to: 'users#create'  
    resources :users
    
    resources :main_shots
end
end
