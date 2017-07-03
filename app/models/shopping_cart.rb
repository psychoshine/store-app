class ShoppingCart < ApplicationRecord
	belongs_to :user, optional: true
	has_many :cart_items, dependent: :destroy
	has_many :shopping_contacts, dependent: :destroy
	has_many :cart_confirms, dependent: :destroy
	
end
