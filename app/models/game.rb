class Game < ApplicationRecord
  has_many :users, validate: true, inverse_of: :game, dependent: :destroy
  validates :users, length: { maximum: 10, minimum: 5 }
  accepts_nested_attributes_for :users
end
