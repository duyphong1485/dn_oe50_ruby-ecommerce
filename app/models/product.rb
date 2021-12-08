class Product < ApplicationRecord
  has_many :oder_details, dependent: :destroy
  belongs_to :category
  validates :image, presence: true, length: {minimum: Settings.length.image}
  scope :recent, ->{order updated_at: :DESC}
  scope :list_product, ->(id){where id: id}
  delegate :name, to: :category, prefix: true

  def check_residual_quantity? quantity_params
    quantity_params.positive?
  end
end
