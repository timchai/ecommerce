class Product < ActiveRecord::Base

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
    price.to_f * 0.09
  end

  def total
    tax + price.to_f
  end

  def self.get_discounted
    Product.where("price < ?", 50)
  end
end
