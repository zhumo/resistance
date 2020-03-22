class CreateTeamMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :team_members do |t|
      t.references :user, null: false, foreign_key: true
      t.references :mission_team, null: false, foreign_key: true
      t.string :result, null: true, limit: 256

      t.timestamps
    end
  end
end
