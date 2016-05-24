class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.belongs_to :order, index: true
      t.belongs_to :user, index: true
      t.string  :url
      t.string  :name
      t.string  :color
      t.string  :size
      t.integer :quantity
      t.text    :u_comment
      t.decimal :unit_price
      t.decimal :total_price

      t.timestamps
    end
  end
end
