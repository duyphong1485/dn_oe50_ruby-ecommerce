class Product < ApplicationRecord
  has_many :oder_details, dependent: :destroy
  belongs_to :category
end
