PinkyStatus::Application.routes.draw do
  root 'events#index'

  resources :events, only: [:index, :create, :destroy]
end
