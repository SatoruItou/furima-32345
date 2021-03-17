class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.string,  name,      null: false
      t.text,    info,      null: false
      t.integer, price,     null: false #300円以上のバリデーション？
      t.integer,  sales_id, null: false
      t.integer,  shipping_id, null: false
      t.integer,  prefecture_id, null: false
      t.integer,  scheduled_id, null: false
      t.integer,  category_id, null:false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
