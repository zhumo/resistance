class Mission < ApplicationRecord
  belongs_to :game, required: true, inverse_of: :missions

  validates :num_players, presence: true
end
