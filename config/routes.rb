Slibujeme::Application.routes.draw do
  root :to => 'homepage#index'
  devise_for :users

  resources :materials, :except => [:destroy] do
    get :search, :on => :collection
    get :advanced_search, :on => :collection
    get :autocomplete_municipality_title, :on => :collection
    get :autocomplete_polititian_name, :on => :collection
    put :flag, :on => :member
    get "/my", :as => "users", :on => :collection
  end
  
  namespace :admin do
    resources :topics, :except => [:show]
    resources :parties, :except => [:show]
    resources :municipalities, :except => [:show]
    resources :polititians, :only => [:index, :edit, :update]
    resources :materials, :only => [:index, :edit, :update]
    resources :elections, :except => [:show]
  end
  
  namespace :api do
    namespace :v1 do
      resources :parties, :only => [:index]
      resources :materials, :only => [:index]
    end
  end
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
