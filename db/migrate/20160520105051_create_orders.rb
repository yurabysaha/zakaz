class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :user, index: true
      t.decimal :subtotal
      t.decimal :inhrn
      t.decimal :tax
      t.decimal :total
      t.string  :status, default: 'init'

      t.timestamps
    end
  end
end