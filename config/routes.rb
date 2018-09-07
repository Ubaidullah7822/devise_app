Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :register do
    member do
      get :register
      post :assign
    end
  end
  root 'home#index'

  devise_for :users , controllers: {
         sessions: 'users/sessions',
         registrations: 'users/registrations',
         confirmations: 'users/confirmations'  }

      get 'logged_in', to: 'home#logged_in', as: :logged_in_home
      get 'logged_out', to: 'home#logged_out', as: :logged_out_home
      get 'signed_up', to: 'home#signed_up', as: :signed_up_home
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
