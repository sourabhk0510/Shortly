class AddGuestAuthenticationTokenToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :guest_authentication_token, :string
  end
end
