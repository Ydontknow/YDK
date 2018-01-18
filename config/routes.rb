Rails.application.routes.draw do

  devise_for :user, controllers: {
  # confirmations: 'users/confirmations',
  passwords: 'users/passwords',
  registrations: 'users/registrations',
  sessions: 'users/sessions',
  # unlocks: 'users/unlocks',
}, skip: [:sessions]

  as :user do
    get 'login' => 'users/sessions#new', as: :new_user_session
    post 'login' => 'users/sessions#create', as: :user_session
    delete 'logout' => 'users/sessions#destroy', as: :destroy_user_session
    get 'register' => 'users/registrations#new'
  end

  root 'welcome#index'

end
