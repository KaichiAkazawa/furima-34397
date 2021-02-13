class Item < ApplicationRecord

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :state_id
    validates :shipping_cost_payer_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :price, 
                numericality: { only_integer: true, 
                  greater_than_or_equal_to: 300, 
                  less_than_or_equal_to: 9999999 }
  end
end
