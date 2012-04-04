class CartItem < ActiveRecord::Base
  attr_accessible :cart_id, :price, :product_id, :quantity
end
# == Schema Information
#
# Table name: cart_items
#
#  id         :integer         not null, primary key
#  cart_id    :integer
#  product_id :integer
#  quantity   :integer
#  price      :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

