class Account < ApplicationRecord
  has_many :oders, dependent: :destroy
  has_many :addresses, dependent: :destroy
end
