class MissionTeam < ApplicationRecord
  belongs_to :game, required: true, inverse_of: :mission_teams
  has_many :team_members, inverse_of: :mission_team, dependent: :destroy
  accepts_nested_attributes_for :team_members
  has_many :users, through: :team_members
end
