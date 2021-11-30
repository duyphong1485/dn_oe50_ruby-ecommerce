class Address < ApplicationRecord
  has_many :oders, dependent: :destroy
  belongs_to :account
end
