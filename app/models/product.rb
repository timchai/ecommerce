class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  belongs_to :user
  has_many :orders
  
  def friendly_created_at
    created_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def sale_message
    if price < 50
      "Discount Item!"
    else
      "On Sale!"
    end
  end
 
  def tax
    price * 0.09
  end

  def total
    tax + price
  end

  def self.get_discounted
    Product.where("price < ?", 50)
  end

end
