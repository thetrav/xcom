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

item("Mini Flashlight",	0.24, ["tool"], 0.24)
item("Heavy Flashlight",	1.6, ["tool"], 1.6)
item("Baton",	0.3, ["tool"], 0.3)
item("Stun Baton",	0.8, ["tool"], 0.8)
item("Small Active Sensor",	1, ["tool"], 1)
item("Inertial Nav System",	4, ["tool"], 4)
item("Small Comp",	1, ["tool"], 1)
item("Personal Comp*",	10, ["tool"], 10)
item("Small Comms",	0.8, ["tool"], 0.8)
item("Medium Comms*",	8, ["tool"], 8)
item("Binos (Electro-Opt)",	2.5, ["tool"], 2.5)
item("Goggles (E-O)",	3, ["tool"], 3)
item("Binos (IR/Hyper)",	6, ["tool"], 6)
item("Goggles (IR/Hyper)",	7, ["tool"], 7)
item("Sensor Pod",	5, ["tool"], 5)
item("Laser/Plasma Torch",	1.8, ["tool"], 1.8)
item("Hvy Las/Plas Torch",	5, ["tool"], 5)
item("Mini Tool Kit",	0.8, ["tool"], 0.8)
item("Portable Tool Kit*",	8, ["tool"], 8)
item("Scout Robot",	4, ["tool"], 4)
item("Rope (3mm, 40m)",	4, ["tool"], 4)
item("Rope (4.5mm, 40m)",	6, ["tool"], 6)
item("Rope (9mm, 40m)",	12, ["tool"], 12)
item("Rope (18mm, 40m)*",	24, ["tool"], 24)
item("Water Bottle",	3.5, ["tool"], 3.5)
item("Water Bottle (2L)",	6.5, ["tool"], 6.5)
item("Meal",	1, ["tool"], 1)
item("Combat Rat Pack",	2.5, ["tool"], 2.5)
item("Biometric Cracker",	3, ["tool"], 3)