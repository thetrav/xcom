Xcom::Application.routes.draw do

  resources :items, :players, :base_items

  match "/base_items_for_player" => "base_items#for_player"

  match "/housekeeping" => "house_keeping#index"
  match "/housekeeping/clear" => "house_keeping#clear"
  match "/housekeeping/upload_players" => "house_keeping#upload_players"
  match "/housekeeping/upload_base_items" => "house_keeping#upload_base_items"

  root :to => 'page#index'

end
