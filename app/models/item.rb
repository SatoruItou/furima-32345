class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :info
    validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }
    validates :image
  end

  belongs_to :user
  has_one_attached :image
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sales
  belongs_to :prefecture
  belongs_to :scheduled
  belongs_to :category
  belongs_to :shipping

  with_options numericality: { other_than: 1 } do
    validates :sales_id
    validates :prefecture_id
    validates :scheduled_id
    validates :category_id
    validates :shipping_id
  end
end
