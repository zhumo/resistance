class CreateMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :missions do |t|
      t.string :status, null: true, limit: 256
      t.integer :num_players, null: false
      t.references :game, null: false

      t.timestamps
    end
  end
end
