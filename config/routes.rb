Rails.application.routes.draw do
  delete '/products/:product_id/reviews/:id', to: 'reviews#destroy', as: :delete_product_review
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  # devise_for :users
  resources :products
  resources :products, only: [:new]
  resources :products do
    resources :reviews, only: [:create, :destroy]
  end

  resources :reviews do
    delete :destroy, on: :member
  end

  resources :products, only: [:index, :show] do
    get 'filter_by_category/:category', action: :filter_by_category, on: :collection
  end

  resources :products, only: [:index, :new, :create, :edit, :update, :destroy]
  root to: 'render#index'
  patch '/products/:id', to: 'products#update'
  get 'render/index'
  

  resources :products do
    resources :solicitudes, only: [:create]
  end

  resources :solicitudes, only: [:new, :create, :index]
  delete 'solicitudes/:id', to: 'solicitudes#destroy', as: 'eliminar_solicitud'
  patch 'solicitudes/:id/aceptar', to: 'solicitudes#aceptar', as: 'aceptar_solicitud'
  patch 'solicitudes/:id/rechazar', to: 'solicitudes#rechazar', as: 'rechazar_solicitud' 
  get 'solicitudes/aceptadas_rechazadas', to: 'solicitudes#aceptadas_rechazadas', as: 'solicitudes_aceptadas_rechazadas'
  get 'solicitudes/pendientes', to: 'solicitudes#pendientes', as: 'solicitudes_pendientes'

  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

