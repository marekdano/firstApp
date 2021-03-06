Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}, :controllers => { registrations: 'registrations', omniauth_callbacks: 'omniauth_callbacks' }

  root 'home#index'

  resources :users, except: [:index, :new]

  resources :products do
    resources :comments
  end

  resources :orders, only: [:index, :show, :create, :destroy]
   
  # admin.site.com/admin/users
  namespace 'admin' do
    #constraints subdomain: 'admin' do
      get '/', to: 'users#index' 
      resources :users, except: [:show]
      resources :products, except: [:show] do
        resources :comments, only: [:destroy]
      end
    #end
  end

  #get 'home/about'
  get '/about', to: 'home#about'
  # get 'home/contact'  
  get '/contact', to: 'home#contact'

  #get 'home/thank_you'
  post '/thank_you', to: 'home#thank_you'

  get '/profile' => 'users#show'

  get '/profile/edit' => 'users#edit'

  put '/profile' => 'users#update'

  post '/payments/create' => 'payments#create'

  get '/my_orders', to: 'users#show_user_orders'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
