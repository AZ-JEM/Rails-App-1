Rails.application.routes.draw do

  # Home      --------------------------------------------------/
  root 'simple_pages#landing_page'

  # Users     --------------------------------------------------/
  devise_for :users, controllers: { registrations: "user_registrations" }

  # Products  --------------------------------------------------/
  resources :products do
    resources :comments
  end

  # Orders    --------------------------------------------------/
  resources :orders, only: [:index, :show, :create, :destroy]

  # Demo      --------------------------------------------------/
  get '/demo', to: redirect('pages/demo.html')

  # Response ---------------------------------------------------/
  post 'simple_pages/thank_you'

  # Contact ---------------------------------------------------/
  get '/contact', to: 'simple_pages#contact'

  # Stripe    --------------------------------------------------/
  post 'payments/create'

  # Admin     --------------------------------------------------/
  get '/table', to: 'products#table'
  get '/users', to: 'users#index'

end
