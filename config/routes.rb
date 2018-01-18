Rails.application.routes.draw do

  devise_for :user, controllers: {
  passwords: 'users/passwords',
  registrations: 'users/registrations',
  sessions: 'users/sessions'
  }, skip: [:sessions]

  as :user do
    get 'login' => 'users/sessions#new', as: :new_user_session
    post 'login' => 'users/sessions#create', as: :user_session
    delete 'logout' => 'users/sessions#destroy', as: :destroy_user_session
    get 'register' => 'users/registrations#new'
    get 'profile' => 'users/sessions#profile'
  end

  root 'welcome#index'

end
