class Item < ActiveRecord::Base
  belongs_to :user

  STATUS_TYPE = { "Новий" => "new", "Неоплачено" => "not_paid", "Оплачено" => "paid", "В дорозі" => "transit", "Доставлено" => "completed" }

  validates :url, :name, :price, :color, :size, :quantity, presence: true
end
