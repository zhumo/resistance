class AddIdentityToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :identity, :string, null: false, limit: 256
  end
end
