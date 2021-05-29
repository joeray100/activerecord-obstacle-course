class Item < ApplicationRecord
  has_many :order_items
  has_many :orders, through: :order_items

  def self.filtered_items(items)
    where.not(id: items)
  end
end
