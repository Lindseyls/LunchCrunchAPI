Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:index, :show, :create]
  resources :categories, only: [:index] do
    resources :organizations, only: [:index]
  end
  resources :transactions, only: [:index] do
    resources :organizations, only: [:index]
  end
end
