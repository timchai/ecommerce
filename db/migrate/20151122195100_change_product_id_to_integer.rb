class ChangeProductIdToInteger < ActiveRecord::Migration
  def change
    change_column :images, :product_id, 'integer USING (trim(price)::integer)'
  end
end
