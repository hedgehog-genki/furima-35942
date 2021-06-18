class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :postal_coad, :prefecture_id, :city, :address, :building, :phone_number, :item_id, :user_id, :token
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_coad, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :phone_number, format: { with: /\A\d{11}\z/, message: "PhoneNumber must be 11 digit Half-width numbers" }
    validates :city
    validates :address
    validates :token
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  end

  def save
    @purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Shipping.create(postal_coad: postal_coad, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, purchase_id: @purchase.id)
  end
end
