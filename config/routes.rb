Rails.application.routes.draw do
  get 'sells/index'
  devise_for :users
  root to: "sells#index"
  resources :sells
end
