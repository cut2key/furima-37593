class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quality
  belongs_to :ship_fee
  belongs_to :country
  belongs_to :ship_day

  validates :item_name, presence: true
  validates :item_description, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :quality_id, numericality: { other_than: 1 }
  validates :ship_fee_id, numericality: { other_than: 1 }
  validates :country_id, numericality: { other_than: 0 }
  validates :ship_day_id, numericality: { other_than: 1 }
  #validates :price, presence: true, format: { with: /\A\d{3,7}+\z/  }
  validates_inclusion_of :price, in:300..9999999
  #validates :user, presence: true

  belongs_to :user
  has_one_attached :image

end
