Xcom::Application.routes.draw do

  resources :inventories, :items, :slots

  root :to => 'page#index'

end
