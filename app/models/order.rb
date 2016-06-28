class Order < ActiveRecord::Base

  has_many :order_items
  belongs_to :user
  before_save :update_subtotal

  STATUS_TYPE = { "Новий" => "new", "Неоплачено" => "not_paid", "Оплачено" => "paid", "В дорозі" => "transit", "Доставлено" => "completed" }



  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end


  private

  def update_subtotal
    self[:subtotal] = subtotal
    self[:inhrn] = self[:subtotal] * 0.09
    self[:total] = self[:inhrn] + (self[:inhrn] * 0.2)
  end
end