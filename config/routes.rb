Xanbook::Application.routes.draw do


  get 'home', to: 'basic#home', as: :home

  get 'about', to: 'basic#about', as: :about

  get 'welcome', to: 'basic#welcome', as: :welcome

  get 'feed', to: 'statuses#index', as: :feed

  get 'profiles/:id', to: 'profiles#show'

  devise_for :users

  devise_scope :user do
    get 'register', to: 'devise/registrations#new', as: :register
    get 'sign_in', to: 'devise/sessions#new', as: :sign_in
    delete 'sign_out', to: 'devise/sessions#destroy', as: :sign_out
  end

  root to: 'basic#home'

  resources :statuses

end
