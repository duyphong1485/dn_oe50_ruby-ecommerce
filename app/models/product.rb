class Product < ApplicationRecord
  has_many :oder_details, dependent: :destroy
  belongs_to :category
  validates :image, presence: true, length: {minimum: Settings.length.image}
  scope :recent, ->{order updated_at: :DESC}
  delegate :name, to: :category, prefix: true
end
