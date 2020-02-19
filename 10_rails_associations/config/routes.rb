Rails.application.routes.draw do
  root 'lists#index'

  resources :lists do
    resources :tokens
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
