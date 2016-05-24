class Order < ActiveRecord::Base

  has_many :order_items
  has_one :user
  before_save :update_subtotal

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