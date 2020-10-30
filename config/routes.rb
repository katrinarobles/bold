Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, :controllers => { :registrations => :registrations }
  resources :courses do
    resources :occurences, only: [ :show, :new, :create, :destroy ]
    resources :bookings, only: [:new, :create ]
    end

  resources :users, only: [ :show ]
  resources :bookings, only: [ :destroy ]
  get '/dashboard', to: 'users#dashboard'
  # #get 'dashboard/courses/:id/occurences/new', to: 'occurences#new', as: 'new_occurrence'
  # get '/users/:id', to: 'users#show' #create logic for only teacher
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
