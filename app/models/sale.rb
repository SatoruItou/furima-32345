class Sale < ApplicationRecord
  validates :name, presence: true
  validates :info, presence: true
  validates :price, #値段の設定？
  validates :image, presence: true
  validates :shipping_id, presence: true
  validates :sales_id, presence: true
  validates :prefecture_id, presence: true
  validates :scheduled_id, presence: true
  validates :category_id, presence: true

  belongs_to :user
  has_one_attached :image
end
