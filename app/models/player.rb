class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :id, :name, :mount_points, :item_ids, :updated_at, :created_at

  serialize :mount_points

  has_many :items, :class_name => "Item", :foreign_key => "player_id", :autosave => true
  has_many :loudouts

  def weight
    items.sum {|it| it.total_weight}
  end
end