class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters" }
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: "is invalid, Input your phone number"}
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}
  

  def save
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, user_id: user_id, item_id: item_id)
    Purchase.create(item_id: item_id, user_id: user_id)
  end
end