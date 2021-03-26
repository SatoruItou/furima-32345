class Item < ApplicationRecord
  validates :name, presence: true
  validates :info, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999 }
  validates :image, presence: true

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sales
  belongs_to :prefecture
  belongs_to :scheduled
  belongs_to :category
  belongs_to :shipping

  validates :sales_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :scheduled_id, numericality: { other_than: 1 }
  validates :category_id, numericality: { other_than: 1 }
  validates :shipping_id, numericality: { other_than: 1 }
end
