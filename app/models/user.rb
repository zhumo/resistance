class User < ApplicationRecord
  SPY_IDENTITY = "spy"
  RESISTANCE_IDENTITY = "resistance"
  VALID_IDENTITIES = [
    SPY_IDENTITY,
    RESISTANCE_IDENTITY,
  ]
  attribute :identity, default: RESISTANCE_IDENTITY

  has_secure_password validations: false

  has_many :team_memberships, inverse_of: :user, class_name: "TeamMember"
  belongs_to :game, required: true, inverse_of: :users

  validates :password,
    length: { maximum: ActiveModel::SecurePassword::MAX_PASSWORD_LENGTH_ALLOWED }
  validates_confirmation_of :password, allow_blank: true
  validates :name, presence: true
  validates :identity, presence: true, inclusion: { in: VALID_IDENTITIES }

  def has_unresolved_missions?
    team_memberships.unresolved.present?
  end
end
