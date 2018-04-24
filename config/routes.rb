Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'simple_pages#index'
  get 'simple_pages/about'
  get 'simple_pages/contact'

end
