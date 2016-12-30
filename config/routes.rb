Rails.application.routes.draw do
  root 'dictionary#index'

  get 'check', :to => 'dictionary#check_word'
end
