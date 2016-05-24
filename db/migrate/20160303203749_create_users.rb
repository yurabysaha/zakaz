class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :phone
      t.string :address
      t.string :role

      t.timestamps null: false
    end
  end
end