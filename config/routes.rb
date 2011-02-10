Release::Application.routes.draw do
  resources :map_images

  resources :map_types

  resources :cal_event_cats

  resources :pois

  resources :poi_cats

  resources :jsonfiles

  resources :venues

  resources :installations

  resources :venue_imports, :only => [:index]
  resources :venue_import_releases, :only => [:index, :new, :pubto]
  resources :importjsons, :only => [:index, :venue, :poi_cat]

  match '/imports',              :to => 'venue_imports#index'
  match '/imports/:vendir',          :to => 'venue_import_releases#index'
  match '/imports/:vendir/new',  :to => 'venue_import_releases#new'
  match '/imports/:vendir/rev/:revndx/pubto',  :to => 'venue_import_releases#pubto'
  match '/imports/:vendir/rev/:revndx',  :to => 'importjsons#index'
  match '/imports/:vendir/rev/:revndx/venue',  :to => 'importjsons#venue'
  match '/imports/:vendir/rev/:revndx/poi_cat',  :to => 'importjsons#poi_cat'
  match '/page/:filename.:format', :to => 'static_pages#page'

# map.page "page/:filename.:format", :controller => 'static_pages', :action => 'page'

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
