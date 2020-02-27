Rails.application.routes.draw do
  resources :people, only: :index
  root 'people#index'
  get 'change_names', to: 'people#change_names'
end
