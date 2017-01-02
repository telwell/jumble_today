Rails.application.routes.draw do
  devise_for :users
  root 'dictionary#index'

  get 'leaderboard', :to => 'leaderboard#index'
  post 'check', :to => 'dictionary#check_word'
  post 'check_victory', :to => 'dictionary#check_victory'
end
