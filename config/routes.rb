Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admins
  scope "/admin" do
    resources :admins
  end
  
  root 'articles#home'
  resources :articles do
  	collection do
  		get 'search'
  	end
  end

  resources :authors
  resources :ontaps
  resources :categories, only: [:index, :new, :create, :show]

  get 'about', :to => 'pages#about', :as => :pages_about
  get 'contact', :to => 'pages#contact', :as => :pages_contact
  get 'sponsor', :to => 'pages#sponsor', :as => :pages_sponsor
  get 'ontap', :to => 'pages#ontap', :as => :pages_ontap
  get 'dashboard', :to => 'pages#dashboard', :as => :pages_dashboard

end
