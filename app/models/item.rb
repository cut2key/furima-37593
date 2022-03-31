class Item < ApplicationRecord

  validates :item_name, presence: true
  validates :item_description, presence: true
  validates :category_id, presence: true
  validates :quality_id, presence: true
  validates :ship_fee_id, presence: true
  validates :country_id, presence: true
  validates :ship_day_id, presence: true
  validates :price, presence: true
  #validates :user, presence: true

  belongs_to :user
  has_one_attached :image
end
