Rails.application.routes.draw do
  get 'delboysession/new'
  post 'delboysession/create'
  delete 'delboysession/destroy'
  get '/delboyconfdel' => 'misc#delboyconfdel', :as => 'conf_del_delboy'
  post '/cartminuss/:id' => 'cart#cartminus', :as => 'crtminus'
  # get 'delaerdelivery/index'
  # get 'delaerdelivery/:id', to: 'delaerdelivery#show'
  get '/homepage' => 'homepage#index', :as => 'home_page'
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
	resources :checkout, only: [:index, :create]
	delete '/cancelorder/:conf' => 'checkout#destroy', :as => 'cancel_order'
	resources :delaerdelivery
	get '/confdel' => 'delaerdelivery#conf', :as => 'conf_del'
	get '/search' => 'pages#search', :as => 'search_page'
	get '/pendingorders' => 'misc#pendingorder_user', :as => 'pending_order_user'
	get '/pendingordersbc/:configkey' => 'misc#pendingorder_userbc', :as => 'pending_order_userbc'
	get '/allorders' => 'misc#allorder_user', :as => 'all_order_user'
	get '/delboypendingorders' => 'misc#delboypendings', :as => 'delboy_pendings'
	get '/delboypeningorders/:id' => 'misc#delboypendingsbc', :as => 'delboy_pendingsbc'
	get '/home' => 'homepage#indexws', :as => 'homepagews'
	get '/editaddressform' => 'misc#editaddress_form', :as => 'editadd'
	post '/updateaddress' => 'misc#editaddress', :as => 'editaddpost' 
	post '/checkaval' => 'homepage#checkaval', :as => 'check_servicable'

	root to: "homepage#index"

	get "/login" => "customersession#new", as: "login"
	delete "/logout" => "customersession#destroy", as: "logout"
	get "/dealerlogin" => "dealersession#new", as: "dealerlogin"
	delete "/dealerlogout" => "dealersession#destroy", as: "dealerlogout"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
