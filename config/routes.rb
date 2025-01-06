Rails.application.routes.draw do
  devise_for :users


  resources :events do
    resources :tickets, only: [:new, :create]
  end

  get 'my_events', to: 'events#my_events'
get 'my_tickets', to: 'tickets#my_tickets'


  root 'events#index'
end
