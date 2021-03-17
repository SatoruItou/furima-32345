class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sales_id
  belongs_to :prefecture_id
  belongs_to :scheduled_id
  belongs_to :category_id
end
