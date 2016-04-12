Rails.application.routes.draw do
  devise_for :admins
  
  root 'articles#home'
  resources :articles do
  	collection do
  		get 'search'
  	end
  end

  resources :authors
  resources :admins

  get 'about', :to => 'pages#about', :as => :pages_about
  get 'contact', :to => 'pages#contact', :as => :pages_contact
  get 'sponsor', :to => 'pages#sponsor', :as => :pages_sponsor
  get 'ontap', :to => 'pages#ontap', :as => :pages_ontap
  get 'dashboard', :to => 'pages#dashboard', :as => :pages_dashboard

end
