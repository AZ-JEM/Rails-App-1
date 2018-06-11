Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'simple_pages/index'

  root 'simple_pages#landing_page'
  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]
  get '/demo', to: redirect('pages/demo.html')

end
