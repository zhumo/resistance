class Game < ApplicationRecord
  has_many :users, validate: true, inverse_of: :game, dependent: :destroy
  accepts_nested_attributes_for :users

  has_many :missions, validate: true, inverse_of: :game, dependent: :destroy
  has_many :mission_teams, inverse_of: :game, dependent: :destroy

  validates :users, length: { maximum: 10, minimum: 5 }
end
