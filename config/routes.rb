Rails.application.routes.draw do
  devise_for :users
  root 'game#index'
  get 'game/index'
  get 'game/scoreboard'
  resources :game


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
