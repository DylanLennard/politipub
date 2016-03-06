Rails.application.routes.draw do
  devise_for :admins
  root 'articles#home'
  resources :articles do
  	collection do
  		get 'search'
  	end
  end

  get 'pages/about'
  get 'pages/contact'
  get 'pages/sponsor'

end
