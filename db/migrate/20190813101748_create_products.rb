class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string     :name,               null: false, index: true
      t.text       :text,               null: false
      t.references :category,           null: false, foreign_key: true
      t.references :size,               null: false, foreign_key: true
      t.references :brand,              optional: true, foreign_key: true
      t.references :prefecture,         null: false
      t.string     :status,          null: false
      t.string     :shipping_fee_payer, null: false
      t.string     :delivery_method,      null: false
      t.string     :delivery_time,      null: false
      t.integer    :price,              null: false
      t.timestamps
    end
  end
end
