require 'csv'

class HouseKeepingController < ApplicationController
  before_filter :authenticate_player!

  def index

  end

  def export
    @players = Player.all
  end

  def clear
    Item.all.each{|it| it.destroy}
    BaseItem.all.each{|it| it.destroy}
    Player.all.each{|it| it.destroy }

    render :text => "success!"
  end

  def upload_players
    process_file do |row|
      row[:name] = row[:name].capitalize
      player = Player.find_by_name(row[:name])
      player ||= Player.new
      un_munge!(row, [:mount_points])
      player.update_attributes!(pick(row, [:name, :mount_points]))
    end
    render :text => "success!"
  end

  def upload_base_items
    process_file do |row|
      row[:name] = row[:name].capitalize
      item = BaseItem.find_by_name(row[:name])
      item ||= BaseItem.new
      un_munge!(row, [:aliases, :accepts, :goes_in, :mount_points])
      item.update_attributes!(pick(row, [ :name, :space, :weight, :capacity, :quantity,
                                           :aliases, :accepts, :goes_in, :mount_points]))
    end

    render :text => "success!"
  end

  private

  def pick(hash, keys)
    hash.reject do |k,_|
      keys.include? k
    end
  end

  def un_munge!(hash, keys)
    keys.each do |key|
      hash[key] = split(hash[key]).map{|it|it.strip.capitalize} unless hash[key].nil?
    end
    hash
  end

  def split(data)
    return nil if data.nil?
    data.split(',')
  end

  def process_file(&block)
    infile = params[:data].read
    csv = CSV.parse(infile, :headers => true)
    csv.each do |row|
      row = row.to_hash.with_indifferent_access
      block.call(row)
    end
  end
end