class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string     :name,               null: false, foreign_key: true
      t.text       :text,        null: false
      t.references :category,           null: false
      t.references :size,               null: false
      t.references :brand,              optional: true
      t.string     :status,          null: false
      t.references :shipping_fee,    null:false
      t.references :delivery_method, null: false
      t.references :delivery_time,   null:false
      t.references :prefecture,    null:false
      t.integer    :price,              null: false
      t.timestamps
    end
  end
end
