class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :product_ids, array: true, default: []
      t.string :status, default: 'open'

      t.timestamps
    end
  end
end
