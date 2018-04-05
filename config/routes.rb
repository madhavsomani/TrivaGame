Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  get 'posts/scoreboard'
  post 'verify_answer' => 'posts#verify_trivia_answer', as: :verify_answer



  resources :posts


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
