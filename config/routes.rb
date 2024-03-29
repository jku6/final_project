PortfolioFinalRails::Application.routes.draw do
  
  # get '/companies/autocomplete_company_name'

  resources :mycomments
  match '/comments' => 'mycomments#create', :via => :post
  

  match 'auth/:provider/callback', to: 'session#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'session#destroy', as: 'signout'

  
  match '/rate' => 'rater#create', :as => 'rate'

  resources :users
  resources :companies do
    resources :comments,:votes,:ratings,:favorites
    get :autocomplete_company_name, :on => :collection
  end

  resources :dashboard
  match '/maps' => 'companies#map', :via => :get
  match '/maps/search' => 'companies#search', :via => :post
  match '/companies/search' => 'companies#search2', :via => :post

  # match '/login' => 'session#new', :via => :get
  # match '/logout' => 'session#destroy', :via => :get
  # match '/session' => 'session#create', :via => :post
  
  match '/maps' => 'companies#create', :via => :post

  mount Foundation::Icons::Rails::Engine => '/fi'
  
  # map.resources :companies, :member => {:rate => :post}

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'dashboard#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
