Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'simple_pages/index'

  # Home      --------------------------------------------------/
  root 'simple_pages#landing_page'

  # Users     --------------------------------------------------/
  devise_for :users, controllers: { registrations: "user_registrations" }

  post 'simple_pages/thank_you'

  get '/contact', to: 'simple_pages#contact'

  # Products  --------------------------------------------------/
  resources :products do
    resources :comments
  end
  # admin
  get '/table', to: 'products#table'

  # Orders    --------------------------------------------------/
  resources :orders, only: [:index, :show, :create, :destroy]

  # Demo      --------------------------------------------------/
  get '/demo', to: redirect('pages/demo.html')

end
