Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  # devise_for :users
  resources :products, only: [:new]
  resources :products, only: [:index, :show] do
    get 'filter_by_category/:category', action: :filter_by_category, on: :collection
  end
  resources :products, only: [:index, :new, :create, :edit, :update, :destroy]
  root to: 'render#index'
  get 'render/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
