require 'csv'

class HouseKeepingController < ApplicationController
  def index

  end

  def clear
    Item.all.each{|it| it.destroy}
    BaseItem.all.each{|it| it.destroy}
    Player.all.each{|it| it.destroy }

    render :text => "success"
  end

  def upload_players
    process_file do |row|
      Player.create!(un_munge!(row, [:mount_points]).symbolize_keys)
    end
    render :text => "success"
  end

  def upload_base_items
    process_file do |row|
      BaseItem.create!(un_munge!(row, [:aliases, :accepts, :goes_in, :mount_points]).symbolize_keys)
    end

    render :text => "success"
  end

  private

  def un_munge!(hash, keys)
    keys.each do |key|
      hash[key] = split(hash[key])
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