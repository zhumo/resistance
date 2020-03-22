class TeamMember < ApplicationRecord
  SUCCESS_RESULT = "success"
  FAIL_RESULT = "fail"
  VALID_RESULTS = [
    SUCCESS_RESULT,
    FAIL_RESULT
  ]
  belongs_to :user, required: true, inverse_of: :team_memberships
  belongs_to :mission_team, required: true, inverse_of: :team_members

  scope :unresolved, -> { where(result: nil) }
  scope :resolved, -> { where.not(result: nil) }

  validates :result, inclusion: { in: VALID_RESULTS, allow_blank: true }
end
