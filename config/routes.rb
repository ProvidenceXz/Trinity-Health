Rails.application.routes.draw do
  devise_for :clinicians
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'pages#home'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  # devise_scope :clinician do get "/clinicians/" => "some_devise_controller" end
  devise_scope :clinician do
    get "/clinicians/sign_in", to: "devise/sessions#new"
    get "/clinicians/sign_out", to: "devise/sessions#destroy"
  end
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
 
  resources :clinicians do
     resources :cases do
      resources :notes
    end
  end
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
  get 'clinicians/:clinician_id/cases/:id/attachments' => 'attachments#index', as: :documents
  get 'clinicians/:clinician_id/cases/:id/add_collaborator' => 'cases#add_collaborator', as: :add_collaborator
  get 'clinicians/:clinician_id/cases/:id/assign_collaborator/:collaborator' => 'cases#assign_collaborator', as: :assign_collaborator

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
