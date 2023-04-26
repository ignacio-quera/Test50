Rails.application.routes.draw do
  delete '/products/:product_id/reviews/:id', to: 'reviews#destroy', as: :delete_product_review
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :questions do
    resources :answers, only: [:new, :create, :destroy]
  end
  resources :products
  resources :products, only: [:new] do
    resources :reviews, only: [:create, :destroy]
  end
  resources :reviews do
    delete :destroy, on: :member
  end
  resources :products, only: [:index, :show] do
    get 'filter_by_category/:category', action: :filter_by_category, on: :collection
  end
  root to: 'render#index'
  patch '/products/:id', to: 'products#update'
  get 'render/index'
end
