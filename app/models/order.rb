class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items
  has_many :items, through: :order_items

  def self.find_orders(amount)
    where('amount = ?', amount)
  end

  def self.find_multiple_orders(amount1, amount2)
    amounts = [amount1, amount2]
    where(amount: amounts)
    # where('orders.amount = ?', amount1).or(where('orders.amount = ?', amount2))
  end

  def self.find_multiple_orders_by_id(ids)
    where(id: ids)
  end

  def self.find_orders_by_amount_range
    where(amount: [700..1000])
  end
end
