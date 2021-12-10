class Account < ApplicationRecord
  attr_accessor :remember_token
  has_many :oders, dependent: :destroy
  has_many :addresses, dependent: :destroy
  before_save{email.downcase!}
  validates :fullname, presence: true,
                        length: {maximum: Settings.length.fullname}
  validates :email, presence: true,
                    length: {maximum: Settings.length.email},
                    format: {with: Settings.email_regex},
                    uniqueness: true
  validates :password, presence: true,
                      length: {minimum: Settings.length.password}, allow_nil: true

  has_secure_password

  def remember
    self.remember_token = Account.new_token
    update_attribute :remember_token, Account.digest(remember_token)
  end

  def authenticated? remember_token
    BCrypt::Password.new(remember_digest).is_password? remember_token
  end

  def forget
    update_attribute :remember_digest, nil
  end

  class << self
    def digest string
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Engine.cost
             end
      BCrypt::Password.create string, cost: cost
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end
end
