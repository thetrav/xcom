Xcom::Application.routes.draw do

  resources :inventories

  root :to => 'page#index'

end
