Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'user/registrations'}

  root 'pages#index'

  # match "/" => "ideas#create", :via => :post, :as => :ideas

  # match '/' => 'ideas#create', :via => :post, :as => :create_idea
  # post '/', to: 'pages#new', as: 'idea'
  # get 'show', to: 'ideas#index', as: 'showidea'


  resources :ideas, only: [:create, :index, :destroy]

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
