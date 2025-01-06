Rails.application.routes.draw do
  devise_for :users


  resources :events do
    resources :tickets, only: [:new, :create]
  end

  root 'events#index'
end
