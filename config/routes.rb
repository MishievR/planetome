Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'user/registrations'}

  root 'pages#index'

  get 'users/:id' => 'users#show', as: :user
  # get 'signup', to: 'users#new'
  resources :users, except: [:new]

  # get 'fields/:id' => 'fields#show', as: :field

  resources :fields
  resources :cities
  resources :communities
  resources :projects do
    resources :updates
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
