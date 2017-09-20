class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.string :base_url, default: '', null: false
      t.string :short_url, default: '', null: false
      t.timestamps
    end
  end
end
