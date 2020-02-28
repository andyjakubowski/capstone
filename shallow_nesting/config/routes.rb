Rails.application.routes.draw do
  resources :spaces, shallow: true do
    resources :lists do
      resources :tokens
    end
  end
end
