class MainShot < ApplicationRecord
	has_attached_file :photo, styles: { medium: "300x300>", large: "500x500>", very_large: "600x600>", main: "1280x1280>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
