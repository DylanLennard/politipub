Rails.application.routes.draw do
  devise_for :admins
  
  root 'articles#home'
  resources :articles do
  	collection do
  		get 'search'
  	end
  end

  resources :authors

  get 'pages/about'
  get 'pages/contact'
  get 'pages/sponsor'
  get 'pages/ontap'

end
