class Item < ApplicationRecord

  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :transport_day
  belongs_to :user
  has_one_attached :image
  has_one :order
  
end
