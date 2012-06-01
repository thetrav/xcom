Xcom::Application.routes.draw do

  resources :inventories, :items, :slots, :players, :bags

  match "/housekeeping" => "house_keeping#index"
  match "/housekeeping/clear" => "house_keeping#clear"
  match "/housekeeping/upload_players" => "house_keeping#upload_players"
  match "/housekeeping/upload_items" => "house_keeping#upload_items"
  match "/housekeeping/upload_slots" => "house_keeping#upload_slots"
  match "/housekeeping/upload_bags" => "house_keeping#upload_bags"

  root :to => 'page#index'

end
