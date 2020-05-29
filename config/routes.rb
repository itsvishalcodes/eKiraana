Rails.application.routes.draw do
  get 'homepage/index'
  # get 'dealersession/new'
  # get 'dealersession/create'
  # get 'dealersession/destroy'
  # get 'customersession/new'
  # post 'customersession/create'
  # delete 'customersession/destroy'
  	resources :dealersession, only: [:new, :create, :destroy]
  	resources :customersession, only: [:new, :create, :destroy]
	resources :customers
	resources :customerpersonalinfos, only: [:new, :create, :edit, :update, :destroy, :show]
	resources :dealers
	resources :dealerpersonalinfos
	resources :products
	resources :cart

	root to: "dealers#index"

	get "/login" => "customersession#new", as: "login"
	delete "/logout" => "customersession#destroy", as: "logout"
	get "/dealerlogin" => "dealersession#new", as: "dealerlogin"
	delete "/dealerlogout" => "dealersession#destroy", as: "dealerlogout"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
