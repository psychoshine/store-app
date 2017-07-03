class ShoppingContact < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :shopping_cart
	validates :state, :city, :adress, :email, :phone, :zip_code, :full_name, presence: true
	validates :zip_code, numericality: { only_integer: true }

	before_save { self.email = email.downcase }
	  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	  validates :email, presence: true, length: { maximum: 255 },
	                    format: { with: VALID_EMAIL_REGEX }
	
end
