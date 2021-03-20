class Sale < ApplicationRecord
  validates :name, presence: true
  validates :info, presence: true
  validates :price, presence: true
  validates :image, presence: true
  validates :shipping_id, presence: true
  validates :sales_id, presence: true
  validates :prefecture_id, presence: true
  validates :scheduled_id, presence: true
  validates :category_id, presence: true

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sales
  belongs_to :prefecture
  belongs_to :scheduled
  belongs_to :category

  validates :sales_id, numercality: { other_than: 1 }
  validates :prefecture_id, numercality: { other_than: 0 }
  validates :scheduled_id, numercality: { other_than: 1 }
  validates :category_id, numercality: { other_than: 1 }
end
