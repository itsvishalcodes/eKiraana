Rails.application.routes.draw do
  # get 'customersession/new'
  # post 'customersession/create'
  # delete 'customersession/destroy'
  	resources :customersession, only: [:new, :create, :destroy]
	resources :customers
	resources :customerpersonalinfos
	resources :dealers do
		resources :products
	end
	resources :dealerpersonalinfos

	root to: "dealers#index"

	get "/login" => "customersession#new", as: "login"
	delete "/logout" => "customersession#destroy", as: "logout"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
