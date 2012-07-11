# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Player.create(:name => "Travis", :email => "the.trav@gmail.com", :password => "Tester1@")
Player.create(:name => "Phil", :email => "duke.herb@gmail.com", :password => "Tester1@")

BaseItem.create(
  name: "test_item", 
  quantity: 5,
  weight: 1,
  space: 2,
  capacity: 4,
  accepts: [],
  aliases: [],
  goes_in: [],
  mount_points: [])

Item.create(:base_item_id => BaseItem.first.id, :player_id => Player.first.id)
Item.create(:base_item_id => BaseItem.first.id, :player_id => Player.first.id, :trashed => true)