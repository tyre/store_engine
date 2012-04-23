  class OrdersController < ApplicationController
    before_filter :verify_is_admin, :only => [:index, :update, :destroy]

    def index
      @orders = Order.all
      if params[:filter]
        @orders = Order.where(:status => params[:filter])
      end
      @filters = Order.select(:status).uniq
      @statuses = Order.count(:all, :group => :status)
      @no_footer = true
    end

    def edit
      @order = Order.find_by_id(params[:id])
    end

    def update
      @order = Order.find_by_id(params[:id])
      @order.update_attributes(params[:order])
      @order.save
      redirect_to orders_path
    end

    def show
      @order = current_user.customer.orders.find_by_id(params[:id])
    end

    def new
      self.create if current_user.customer
      @order = Order.new(customer:
        Customer.find_or_create_by_user(current_user))
    end

    def create
      @order = customer.orders.create_from_cart(@cart)
      if @order.save
        redirect_to order_path(@order)
      else
        render :new
      end
    end

    def one_click
      if current_user.one_click_available?
        order = OneClickOrder.create(current_user, params[:product])
        redirect_to order_path(order)
      else
        flash[:message] = t(:one_click_non_customer)
        redirect_to new_order_path
      end
    end

    def destroy
      @order = Order.find_by_id(params[:id])
      @order.destroy
      redirect_to orders_path
    end

private
  def customer
    @customer ||= current_user.customer || Customer.create(params[:customer])
  end
end
