Rails.application.routes.draw do

  root 'buy_posts#index'

  devise_for :users, controllers: {
  	sessions: 'users/sessions',
  	passwords: 'users/passwords',
  	registrations: 'users/registrations'
  }
  devise_scope :user do
  	post 'users/sign_up/address_registration' => 'users/registrations#address_registration', as: 'new_user_registration_address'
  	get 'users/sign_up/registration_complete' => 'users/registrations#registration_complete', as: 'new_user_registration_complete'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update]

  get 'users/:id/mypage' => 'users#mypage', as: "user_mypage"

  resources :buy_posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
  	resource :favorites, only: [:create, :destroy]
  end

  resources :offers, path: '/buy_posts/:id/offers/'
  resources :offer_comments, only: [:create, :destroy], path: '/buy_posts/:id/offers/:id/offer_comment'

end