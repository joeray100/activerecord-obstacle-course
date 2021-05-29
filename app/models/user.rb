class User < ApplicationRecord
  has_many :orders
  has_many :order_items, through: :orders
  has_many :items, through: :order_items

  def self.names_of_users_ordered_one_item(id)
    joins(:order_items).where('item_id = ?', id).order(:name).distinct.pluck(:name)
  end

  def total_order_count
    orders.count
  end

  def total_item_count
    items.count
  end

  def self.users_orders_and_avg_item_cost
    joins(orders: :order_items)
    .select('users.name as user_name, orders.id as order_id, (orders.amount / count(order_items.id)) as avg_item_cost')
    .group(:name, 'orders.id')
    .order('users.name DESC, avg_item_cost')
  end
end
