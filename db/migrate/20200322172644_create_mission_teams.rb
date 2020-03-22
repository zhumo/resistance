class CreateMissionTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :mission_teams do |t|
      t.references :game, null: false

      t.timestamps
    end
  end
end
