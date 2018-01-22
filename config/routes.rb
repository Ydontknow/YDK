Rails.application.routes.draw do

  get 'users/index'

  get 'users/show'

  devise_for :user, controllers: {
  passwords: 'users/passwords',
  registrations: 'users/registrations',
  sessions: 'users/sessions'
  }, skip: [:sessions], :path_prefix => 'd'

  as :user do
    get 'login' => 'users/sessions#new', as: :new_user_session
    post 'login' => 'users/sessions#create', as: :user_session
    delete 'logout' => 'users/sessions#destroy', as: :destroy_user_session
    get 'register' => 'users/registrations#new'
    get 'profile' => 'users/sessions#profile'
  end

  root 'welcome#index'

  match '/users',   to: 'users#index',   via: 'get'
  match '/users/:id',     to: 'users#show',       via: 'get'

  resources :users, :only => [:show]

end
