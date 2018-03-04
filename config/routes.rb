Rails.application.routes.draw do
  devise_for :users, :controllers => { registrtions: 'user/registrations'}

  root 'pages#index'

  get 'users/:id' => 'users#show', as: :user
  # get 'signup', to: 'users#new'
  resources :users, except: [:new]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
