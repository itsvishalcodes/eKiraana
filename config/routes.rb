Rails.application.routes.draw do
  # get 'customersession/new'
  # post 'customersession/create'
  # delete 'customersession/destroy'
  	resources :customersession, only: [:new, :create, :destroy]
	resources :customers do
		resources :cart
		resources :cpendingorders
		resources :corders
	end
	resources :customerpersonalinfos, only: [:new, :create, :edit, :update, :destroy, :show]
	resources :dealers do
		resources :products
		resources :dpendingorders
		resources :dorders
	end
	resources :dealerpersonalinfos

	root to: "dealerpersonalinfos#index"

	get "/login" => "customersession#new", as: "login"
	delete "/logout" => "customersession#destroy", as: "logout"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
