class OneClickOrder
  DEFAULT_STATUS = "paid"

  def self.create(user, product_id)
    user.orders.build_from_product_id(product_id).tap do |order|
      order.customer = user.customer
      order.status = DEFAULT_STATUS
      order.save!
    end
  end
end