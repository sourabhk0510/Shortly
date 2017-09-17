class CreatePolls < ActiveRecord::Migration[5.1]
	def change
		create_table :polls do |t|
			t.string :title
			t.text :description
			t.string :status
			t.references :creator
			t.timestamps
		end
		add_foreign_key :polls, :users, column: :creator_id
	end
end
