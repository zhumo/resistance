class Mission < ApplicationRecord
  SUCCESS_MISSION_STATUS = "success"
  FAILURE_MISSION_STATUS = "failure"
  VALID_MISSION_STATUSES = [
    SUCCESS_MISSION_STATUS,
    FAILURE_MISSION_STATUS,
  ]

  belongs_to :game, required: true, inverse_of: :missions

  validates :num_players, presence: true
  validates :status, inclusion: { in: VALID_MISSION_STATUSES, allow_blank: true }
end
