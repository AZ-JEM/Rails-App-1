Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'simple_pages/index'

  # ---------------------------------------------------------------------- /
  # Exercise 5.1
  # ---------------------------------------------------------------------- /
  #   Entities affected : { demo, navigation & routes }
  #   Essentially demo and landing have swapped roles...
  #   No significant changes from 4.7
  # ---------------------------------------------------------------------- /

  # root 'simple_pages#landing_page'
  root to: redirect('pages/demo.html')

  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]

  # get '/demo', to: redirect('pages/demo.html')
  get '/home', to: 'simple_pages#landing_page'

end
