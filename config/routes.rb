Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'simple_pages/index'

  # root 'simple_pages#index'

  get '/demo', :to => redirect('pages/demo.html')

  # get 'simple_pages/demo'
  get 'simple_pages/landing_page'

  resources :products

  # Exercise 4.3
  resources :orders, only: [:index, :show, :create, :destroy]

  root 'simple_pages#landing_page'

end
