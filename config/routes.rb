Xcom::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  match "/players/sign_up" => 'page#index'

  devise_for :players

  resources :items, :players, :base_items, :loadouts

  match "/player/:player_id/loadout/:id" => "loadouts#apply"

  match "/base_items_for_player" => "base_items#for_player"
  match "/base_items_for_item/:item" => "base_items#for_item"

  match "/housekeeping" => "house_keeping#index"
  match "/housekeeping/export" => "house_keeping#export"
  match "/housekeeping/clear" => "house_keeping#clear"
  match "/housekeeping/upload_players" => "house_keeping#upload_players"
  match "/housekeeping/upload_base_items" => "house_keeping#upload_base_items"

  match "/base" => "base_inventory#index"

  root :to => 'page#index'

end
