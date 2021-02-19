class AddPurchaseIdToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :purchase, foreign_key: true
  end
end
