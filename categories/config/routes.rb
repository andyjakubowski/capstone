Rails.application.routes.draw do
  resources :categories, except: [:show, :index]
  resources :lists do
    resources :tokens
  end

  root 'lists#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
