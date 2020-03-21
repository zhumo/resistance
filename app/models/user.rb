class User < ApplicationRecord
  has_secure_password validations: false

  belongs_to :game, required: true, inverse_of: :users

  validates :password, 
    length: { maximum: ActiveModel::SecurePassword::MAX_PASSWORD_LENGTH_ALLOWED }
  validates_confirmation_of :password, allow_blank: true
  validates :name, presence: true
end
