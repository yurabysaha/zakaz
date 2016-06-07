class OrderItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :order


  #validates :url, :name, :unit_price, :color, :size, :quantity, :total_price, presence: true
  #validates :quantity, numericality: { only_integer: true, greater_than: 0 }

  before_save :finalize


  private
=begin
  def product_present
    if product.nil?
      errors.add(:product, "is not valid or is not active.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end
=end

  def finalize
    self[:total_price] = quantity * self[:unit_price]
  end


end
