Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'simple_pages/index'

  # Authentication
  devise_for :users, controllers: { registrations: "user_registrations" }

  root 'simple_pages#landing_page'
  # root to: redirect('pages/demo.html')

  resources :products do
    resources :comments
  end

  resources :orders, only: [:index, :show, :create, :destroy]

  get '/demo', to: redirect('pages/demo.html')
  # get '/home', to: 'simple_pages#landing_page'

  get '/contact', to: 'simple_pages#contact'

  get '/table', to: 'products#table'

  post 'simple_pages/thank_you'

end
