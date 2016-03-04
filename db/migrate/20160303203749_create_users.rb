class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :mail
      t.string :password_digest
      t.string :role

      t.timestamps null: false
    end
  end
end