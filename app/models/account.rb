class Account < ApplicationRecord
  has_many :oders, dependent: :destroy
  has_many :addresses, dependent: :destroy
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  before_save{email.downcase!}
  validates :fullname, presence: true,
                      length: {maximum: Settings.length.fullname}
  validates :email, presence: true,
                    length: {maximum: Settings.length.email},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: true
  validates :password, presence: true,
                      length: {minimum: Settings.length.password}

  has_secure_password
  class << self
    def digest string
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Engine.cost
             end
      BCrypt::Password.create string, cost: cost
    end
  end
end
