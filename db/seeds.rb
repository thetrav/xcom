# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

travis = Player.new(:name => "travis")
inventory = Inventory.new(:name => "Gear")
inventory.slots << Slot.new(:name => "Primary Weapon", :accepts => ["weapon"])
inventory.slots << Slot.new(:name => "Side Arm", :accepts => ["side-arm"])
inventory.slots << Slot.new(:name => "Slung Weapon", :accepts => ["weapon"])
inventory.slots << Slot.new(:name => "Melee Weapon", :accepts => ["melee"])
inventory.slots << Slot.new(:name => "Melee Weapon", :accepts => ["melee"])
inventory.slots << Slot.new(:name => "Chest", :accepts => [])
inventory.slots << Slot.new(:name => "Belt", :accepts => ["belt"])
inventory.slots << Slot.new(:name => "Pack", :accepts => ["backpack"])
travis.inventories << inventory

armour = Bag.new(:name => "Armour")
travis.bags << armour

travis.save!

Item.create(:name => "Utility Belt", :aliases => "belt")
Item.create(:name => "Full Belt", :aliases => "belt")

Item.create(:name => "Day Pack", :aliases => ["backpack"])
Item.create(:name => "Big Pack", :aliases => ["backpack"])
Item.create(:name => "Ammo Pack", :aliases => ["backpack"])
Item.create(:name => "Exo Pack Std", :aliases => ["backpack"])
Item.create(:name => "Exo Pack Ammo", :aliases => ["backpack"])