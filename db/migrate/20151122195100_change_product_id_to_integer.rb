class ChangeProductIdToInteger < ActiveRecord::Migration
  def change
    change_column :images, :product_id, 'integer USING (trim(product_id)::integer)'
  end
end
