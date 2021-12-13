class Oder < ApplicationRecord
  has_many :oder_details, dependent: :destroy
  has_many :products, through: :oder_details
  belongs_to :account
  belongs_to :address

  class << self
    def search keyword
      joins(:account)
        .joins(:address)
        .where("accounts.fullname LIKE ? or addresses.address LIKE ?", "%#{keyword}%", "%#{keyword}%")
    end
  end
end
