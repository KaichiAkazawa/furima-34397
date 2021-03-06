class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping_cost_payer
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    with_options numericality: { other_than: 1, message: 'Select' } do
      validates :category_id
      validates :state_id
      validates :shipping_cost_payer_id
      validates :prefecture_id
      validates :shipping_day_id
    end
    validates :price, numericality: { only_integer: true, message: 'Half-width number' }
  end
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
end
