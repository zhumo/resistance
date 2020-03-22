class TeamMember < ApplicationRecord
  belongs_to :user, required: true, inverse_of: :team_memberships
  belongs_to :mission_team, required: true, inverse_of: :team_members
end
