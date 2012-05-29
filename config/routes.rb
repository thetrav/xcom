Xcom::Application.routes.draw do

  resources :inventories, :items, :slots, :players, :bags

  root :to => 'page#index'

end
