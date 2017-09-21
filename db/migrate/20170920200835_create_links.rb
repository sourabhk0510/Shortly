class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.string :base_url, default: '', null: false
      t.string :short_url, default: '', null: false
      t.integer :clicks, default: 0, null: false
      t.references :creator
      t.timestamps
    end
    add_foreign_key :links, :users, column: :creator_id
  end
end
