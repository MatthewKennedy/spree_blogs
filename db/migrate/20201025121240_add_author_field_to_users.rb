class AddAuthorFieldToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :spree_users, :nickname, :string
  end
end
