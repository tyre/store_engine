class UsersController < ApplicationController
  before_filter { @cart = find_or_create_cart_from_session }

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      user_saved
    else
      flash[:message] = "We were unable to complete your request at this time."
      redirect_to new_user_path
    end
  end

  def show
    @search = Search.new
    if current_user.customer
      @orders = current_user.customer.orders
    else
      @orders = []
    end
  end

  private

  def user_saved
    user = login(params[:user][:email],
      params[:user][:password], params[:user][:remember_me])
    flash[:message] = "Signup successful, #{@user.name}! Now buy things!"
    redirect_to user_path(@user)
  end

  def find_or_create_cart_from_session
    cart = Cart.find_by_id(session[:cart_id])
    cart ||= Cart.create(:user => current_user)
    session[:cart_id] = cart.id
    cart
  end

end
