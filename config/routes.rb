Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'user/registrations'}

  root 'pages#index'
  resources :ideas

  # match 'create' => 'ideas#new', :via => :post


  get 'users/:id' => 'users#show', as: :user
  # get 'signup', to: 'users#new'
  resources :users, except: [:new]

  # post 'ideas' => 'ideas#create', as: :create
  # get 'idea', action: :create, controller: 'ideas'

  resources :fields
  resources :cities
  resources :communities do
    resources :posts
  end
  resources :projects do
    resources :updates
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
