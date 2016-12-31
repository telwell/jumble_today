Rails.application.routes.draw do
  devise_for :users
  root 'dictionary#index'

  get 'check', :to => 'dictionary#check_word'
end
