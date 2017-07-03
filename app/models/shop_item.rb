class ShopItem < ApplicationRecord
	
	has_many :cart_items
	has_attached_file :shop_image, styles: { medium: "300x300>", large: "500x500>", very_large: "600x600>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :shop_image, content_type: /\Aimage\/.*\z/
  	include PgSearch
	pg_search_scope :search_for_items, against: [:title1, :title2, :description1, :description2]
end
