class Supplier < ActiveRecord::Base
  has_many :products

  validates :name, :email, :phone, uniqueness: true

end
