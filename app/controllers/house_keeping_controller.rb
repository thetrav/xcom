require 'csv'

class HouseKeepingController < ApplicationController
  def index

  end

  def clear
    Bag.all.each {|it| it.destroy}
    Slot.all.each{|it| it.destroy}
    Item.all.each{|it| it.destroy}
    Player.all.each{|it| it.destroy }

    render :text => "success"
  end

  def upload_players
    process_file do |row|
      puts "row #{row}"
      player = Player.create(:name => row["Name"])

      player.slots << Slot.new(:name => "Primary Weapon", :accepts => ["primary-weapon"])
      player.slots << Slot.new(:name => "Side Arm", :accepts => ["side-arm"])
      player.slots << Slot.new(:name => "Slung Weapon", :accepts => ["weapon"])
      player.slots << Slot.new(:name => "Melee Weapon", :accepts => ["melee"])
      player.slots << Slot.new(:name => "Melee Weapon", :accepts => ["melee"])
      player.slots << Slot.new(:name => "Chest", :accepts => [])
      player.slots << Slot.new(:name => "Belt", :accepts => ["belt"])
      player.slots << Slot.new(:name => "Pack", :accepts => ["backpack"])

      player.bags << Bag.create(:name => "Armour", :accepts => ["armour"])
      player.save!
    end
    render :text => "success"
  end

  def upload_slots
    process_file do |row|
      Slot.create!(:name => row[:label],
                   :accepts => row[:accepts].split(','),
                   :item_parent_id => Item.find_by_name(row[:item_name]).id)
    end
    render :text => "success"
  end

  def upload_bags
    process_file do |row|
      bag = Bag.create!(:name => row[:label],
                 :capacity => row[:capacity],
                 :accepts => row[:accepts].split(','))
      item = Item.find_by_name(row[:item_name])
      item.bag_child_id = bag.id
      item.save!
      bag.save!
    end
    render :text => "success"
  end

  def upload_items
    process_file do |row|
      Item.create!(:name => row[:name],
                   :space => row[:space],
                   :weight => row[:weight],
                   :aliases => row[:aliases].split(','))
    end

    render :text => "success"
  end

  private

  def process_file(&block)
    infile = params[:data].read
    csv = CSV.parse(infile, :headers => true)
    csv.each do |row|
      row = row.to_hash.with_indifferent_access
      block.call(row)
    end
  end
end