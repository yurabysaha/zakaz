class Item < ActiveRecord::Base
  belongs_to :user

  validates :url, :name, :price, :color, :size, :quantity, presence: true

end
