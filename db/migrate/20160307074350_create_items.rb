class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :user, index: true
      t.string :url
      t.string :name
      t.integer :price
      t.string :color
      t.string :size
      t.integer :quantity
      t.text :u_comment
      t.string :status, default: 'new'
      t.text :a_comment
      t.integer :total_price

      t.timestamps null: false
    end
  end
end
