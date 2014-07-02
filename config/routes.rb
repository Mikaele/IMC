Rails.application.routes.draw do

  resources :categories

  get 'index',to: 'index#index'

  resources :perfils

  resources :solutions

  resources :incidentes

  resources :calls

  resources :colaboradors

  resources :ics

  resources :services

  resources :clients

  get "/resolver/:id", to: "calls#resolver"
  get "/incidentes/new/:id", to: "incidentes#new"
  get "/solutions/new/:id", to: "solutions#new"
  get "/ja_resolvi/:id", to: "calls#ja_resolvi"
  get "/abandonar/:id", to: "calls#abandonar"
  post  "/resolvida_enviar", to: "calls#resolvida_enviar"
  get "/escalonar/:id", to: "calls#escalonar"
  get "/meus_chamados", to: "calls#meus_cahamados"
  get "/chamado_horas" , to: "calls#chamado_horas"
  post "/chamado_horas" , to: "calls#chamado_horas"
  get "/chamado_horas_colaborador" , to: "calls#chamado_horas_colaborador"
  get "/chamado_estado" , to: "calls#chamado_estado"
  post "/chamado_estado" , to: "calls#chamado_estado"

  devise_for :users

  devise_scope :user do
    get "sign_in", to: "devise/sessions#new"
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root :to=> 'index#index'

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
