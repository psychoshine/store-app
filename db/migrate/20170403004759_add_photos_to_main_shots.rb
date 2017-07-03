class AddPhotosToMainShots < ActiveRecord::Migration[5.0]
	def up
	    add_attachment :main_shots, :photo
	end

	def down
	    remove_attachment :main_shots, :photo
	end

end
