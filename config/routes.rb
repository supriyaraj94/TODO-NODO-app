Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  resources :lists do
    resources :items do
      resources :comments
      put :sort, on: :collection
    end
  end
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
  get 'home', to:'home#index'
  get 'master/search/(:q)', to: 'master#search', as: :search_lists
  get 'master/exportData', to:'master#exportData'
  get 'master/formatData', to:'master#formatData'
  get 'master', to: 'master#index', as: :master
  get 'master/view/(:email)' ,to: 'master#view', as: :view_as_master
  get 'lists/(:list_id)/items/showLists/(:item_id)', to: 'items#showLists', as: :show_lists
  get 'lists/moveItem/(:item_id)', to: 'items#moveItem', via: [:get] ,as: :move_item
end
