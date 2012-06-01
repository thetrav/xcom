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

def item(name, weight, aliases = [], space = nil)
  Item.create(:name => name, :aliases => aliases, :space => space, :weight => weight)
end

belt = item("Utility Belt", 0.5, ["belt"])
belt.bag_child = Bag.create(:name => "Utility Belt", :capacity => 10, :accepts => ["tool"])
belt.save!

item("Full Belt", 0.5, ["belt"])

item("Day Pack", 0.75, ["backpack"])

item("Big Pack", 2, ["backpack"])
item("Ammo Pack", 10.6, ["backpack"])
item("Exo Pack Std", 2, ["backpack"])
item("Exo Pack Ammo", 12.6, ["backpack"])

item("Mini Flashlight",	0.24, ["tool"])
item("Heavy Flashlight",	1.6, ["tool"])
item("Baton",	0.3, ["tool"])
item("Stun Baton",	0.8, ["tool"])
item("Small Active Sensor",	1, ["tool"])
item("Inertial Nav System",	4, ["tool"])
item("Small Comp",	1, ["tool"])
item("Personal Comp*",	10, ["tool"])
item("Small Comms",	0.8, ["tool"])
item("Medium Comms*",	8, ["tool"])
item("Binos (Electro-Opt)",	2.5, ["tool"])
item("Goggles (E-O)",	3, ["tool"])
item("Binos (IR/Hyper)",	6, ["tool"])
item("Goggles (IR/Hyper)",	7, ["tool"])
item("Sensor Pod",	5, ["tool"])
item("Laser/Plasma Torch",	1.8, ["tool"])
item("Hvy Las/Plas Torch",	5, ["tool"])
item("Mini Tool Kit",	0.8, ["tool"])
item("Portable Tool Kit*",	8, ["tool"])
item("Scout Robot",	4, ["tool"])
item("Rope (3mm, 40m)",	4, ["tool"])
item("Rope (4.5mm, 40m)",	6, ["tool"])
item("Rope (9mm, 40m)",	12, ["tool"])
item("Rope (18mm, 40m)*",	24, ["tool"])
item("Water Bottle",	3.5, ["tool"])
item("Water Bottle (2L)",	6.5, ["tool"])
item("Meal",	1, ["tool"])
item("Combat Rat Pack",	2.5, ["tool"])
item("Biometric Cracker",	3, ["tool"])