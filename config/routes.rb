Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :courses

  get '/dashboard', to: 'users#dashboard'
  get 'dashboard/courses/:id/occurences/new', to: 'occurences#new', as: 'new_occurrence'
  get '/users/:id', to: 'users#show' #create logic for only teacher
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
