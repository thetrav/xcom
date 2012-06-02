# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

travis = Player.create!(:name => "travis")

bagBase = BaseItem.create!(
    :name => "bag",
    :accepts => ["all"],
    :capacity => 100,
    :weight => 1,
)
bag = Item.create!(
    :player_id => travis.id,
    :base_item_id => bagBase.id
)

rockBase = BaseItem.create!(
    :name => "rock",
    :weight => 5,
    :space => 5,

)
Item.create!(
    :parent_item_id => bag.id,
    :base_item_id => rockBase.id
)

paperBase = BaseItem.create!(
    :name => "paper",
    :weight => 0.1,
    :space => 0.5,

)
Item.create!(
    :parent_item_id => bag.id,
    :base_item_id => paperBase.id
)

scissorBase = BaseItem.create!(
    :name => "scissors",
    :weight => 0.2,
    :space => 0.1,
)
Item.create!(
    :parent_item_id => bag.id,
    :base_item_id => scissorBase.id
)

BaseItem.create!(
    :name => "first",
    :accepts => ["all"],
    :goes_in => ["player"],
    :capacity => 100,
    :weight => 10,
    :quantity => 2
)

BaseItem.create!(
    :name => "socket",
    :accepts => ["gem"],
    :goes_in => ["player"],
    :capacity => 1,
    :weight => 1,
    :space => 5,
    :quantity => 2
)

BaseItem.create!(
    :name => "gem holder",
    :accepts => ["gem"],
    :goes_in => ["player"],
    :capacity => 1,
    :weight => 1,
    :space => 5,
    :quantity => 2
)

BaseItem.create!(
    :name => "gem",
    :weight => 0.1,
    :space => 1,
    :quantity => 2
)

BaseItem.create!(
    :name => "fake gem",
    :aliases => ["gem"],
    :weight => 0.1,
    :space => 1,
    :quantity => 2
)

BaseItem.create!(
    :name => "socket filler",
    :goes_in => "socket",
    :weight => 0.1,
    :space => 1,
    :quantity => 2
)