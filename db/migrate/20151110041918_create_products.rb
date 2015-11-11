class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :item
      t.string :description
      t.string :size
      t.string :price

      t.timestamps null: false
    end
  end
end
