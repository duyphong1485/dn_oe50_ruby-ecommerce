class Oder < ApplicationRecord
  has_many :oder_details, dependent: :destroy
  belongs_to :account
  belongs_to :address
end
