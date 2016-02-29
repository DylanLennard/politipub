Rails.application.routes.draw do
  devise_for :admins
  root 'articles#home'
  resources :articles
end
