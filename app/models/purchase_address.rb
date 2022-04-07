class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :zip_code, :country_id, :city, :st_address, :building, :phone_num, :user_id, :item_id, :token

  
  with_options presence: true do
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, allow_blank: true, message: "is invalid. Include hyphen(-)"}
    validates :country_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :st_address
    validates :phone_num, format: {with: /\d{10,11}\z/, allow_blank: true, message: "is invalid. Accept number only"}
    validates :user_id
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    Address.create(zip_code: zip_code, country_id: country_id, city: city, st_address: st_address, building: building, phone_num: phone_num, purchase_id: purchase.id)
  end
end