Xcom::Application.routes.draw do

  resources :inventories, :items

  root :to => 'page#index'

end
