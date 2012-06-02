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
      Player.create!(:name => row["Name"])
    end
    render :text => "success"
  end

  def upload_base_items
    process_file do |row|
      BaseItem.create!( :name => row[:name],
                        :space => row[:space],
                        :weight => row[:weight],
                        :capacity => row[:capacity],
                        :quantity => row[:quantity],
                        :aliases => split(row[:aliases]),
                        :accepts => split(row[:accepts]),
                        :goes_in => split(row[:goes_in]))
    end

    render :text => "success"
  end

  private

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