Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'simple_pages/index'

  # root 'simple_pages#index'
  root 'simple_pages#landing_page'

  get 'simple_pages/about'
  get 'simple_pages/contact'

  resources :products

  # Exercise 4.3
  resources :orders, only: [:index, :show, :create, :destroy]

end
