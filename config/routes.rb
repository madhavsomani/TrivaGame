Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  get 'posts/scoreboard'
  match '/posts',      to: 'posts#verify_trivia_answer', via: 'post'
  resources :posts


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
