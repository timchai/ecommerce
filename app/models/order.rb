class Order < ActiveRecord::Base
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products



 # validates :user, :product, :quantity, :subtotal, :tax, :total, presence: true
 # validates :user_id, :product_id, :quantity, :subtotal, :tax, :total, numericality: true
 # validate :quantity_must_be_5

  def quantity_must_be_5
    if quantity != 5
      errors.add(:quantity, "Hey, only input 5")
    end
  end
end
