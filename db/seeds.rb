# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

travis = Inventory.new(:name => "travis")
weapon = Slot.new(:name => "primary weapon")
travis.slots << weapon
rifle = Item.new(:name => "AK-47")
weapon.item = rifle
rifle_accessories = Inventory.new(:name => "rifle accessories")
rifle.inventory = rifle_accessories
top_rail = Slot.new(:name => "top rail")
rifle_accessories.slots << top_rail
scope = Item.new(:name => "scope")
top_rail.item = scope
bottom_rail = Slot.new(:name => "bottom rail")
rifle_accessories.slots << bottom_rail

travis.save!

Item.create(:name => "UGL")
Item.create(:name => "Strap")