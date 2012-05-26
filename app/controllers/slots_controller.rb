class SlotsController < ApplicationController
  def update
    slot = Slot.find(params[:id])
    old_item = slot.item
    old_item.slot_id = nil unless old_item.nil?
    old_item.save! unless old_item.nil?
    begin
      slot.item = Item.find(params[:item_id])
    rescue Exception => e
      slot.item = nil
    end
    slot.save!

    render :json => slot.jsonify
  end
end
