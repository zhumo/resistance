class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 256
      t.string :password_digest, null: true, limit: 256
      t.references :game, null: false

      t.timestamps
    end
  end
end
