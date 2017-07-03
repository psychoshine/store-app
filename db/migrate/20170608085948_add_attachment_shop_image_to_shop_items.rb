class AddAttachmentShopImageToShopItems < ActiveRecord::Migration
  	def up
	    add_attachment :shop_items, :shop_image
	end

	def down
	    remove_attachment :shop_items, :shop_image
	end
end
