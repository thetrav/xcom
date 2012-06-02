require 'csv'

class HouseKeepingController < ApplicationController
  def index

  end

  def clear
    Item.all.each{|it| it.destroy}
    Player.all.each{|it| it.destroy }

    render :text => "success"
  end

  def upload_players
    process_file do |row|
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