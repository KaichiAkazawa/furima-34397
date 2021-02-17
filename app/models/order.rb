class Order < ApplicationRecord
  belongs_to :purchase

  POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  PHONE_NUMBER_REGEX = /\A\d{,11}\z/.freeze
  with_options presence: true do
    validates :postal_code, format: { with: POSTAL_CODE_REGEX, message: "" }
    validates :prefecture_id
    validates :city
    validates :address_number
    validates :phone_number, format: { with: PHONE_NUMBER_REGEX, message: "" }
  end
end
