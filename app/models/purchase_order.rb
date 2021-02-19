class PurchaseOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address_number, :building_name, :phone_number, :token,
                :user_id, :item_id

  POSTAL_CODE_REGEX = /\A\d{3}-\d{4}\z/.freeze
  PHONE_NUMBER_REGEX = /\A\d{,11}\z/.freeze
  with_options presence: true do
    validates :postal_code, format: { with: POSTAL_CODE_REGEX, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :address_number
    validates :phone_number, format: { with: PHONE_NUMBER_REGEX, message: 'Input only number' }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Order.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city,
                 address_number: address_number, building_name: building_name,
                 phone_number: phone_number, purchase_id: purchase.id)
  end
end
