class CartedProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :category
  belongs_to :user
  belongs_to :order

  validates :quantity, numericality: true
end
