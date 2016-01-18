Rails.application.routes.draw do


  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :listings do
    resources :reservations
  end
  
  resources :reservations, only: [:index, :show]

  # resources :users, controller: "users", only: [:create] do
  #   resource :password,
  #     controller: "clearance/passwords",
  #     only: [:create, :edit, :update]
  # end

  get "/preload", to: "reservations#preload"
  post "/search", to: "listings#search", as: :search
  get "tags/:tag", to: 'listings#index', as: :tag
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"
  resources :users

  # Alternative way to get FB authentication
  match 'auth/:provider/callback', to: 'sessions#create_from_omniauth', via: [:get, :post]
  # match 'auth/failure', to: redirect('/'), via: [:get, :post]
  # match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  # FB authentication
  # get '/auth/:provider/callback' => 'sessions#create_fb'
  # get '/signout' => 'sessions#destroy_fb', :as => :signout
  # get '/signin' => 'sessions#new', :as => :signin

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
