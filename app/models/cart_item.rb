class CartItem < ApplicationRecord
	belongs_to :shop_item
	belongs_to :shopping_cart, optional: true
	validates :quantity, :shop_price, presence: true
	validates :quantity, numericality: { only_integer: true }
	validates :shop_price, numericality: true


end
