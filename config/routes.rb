Rails.application.routes.draw do
	resources :customers
	resources :customerpersonalinfos
	resources :dealers do
		resources :products
	end
	resources :dealerpersonalinfos

	root to: "products#index"

	get "/login" => "session#new", as: "login"
	delete "/logout" => "session#destroy", as: "logout"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
