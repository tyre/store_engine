class CategoriesController < ApplicationController
  before_filter :verify_is_admin, :except => [:index, :show]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.new(params[:category])
    category.save
    redirect_to categories_path
  end

  def show
    @category = Category.find_by_id(params[:id])
  end

  def destroy
    Category.find_by_id(params[:id]).destroy
    redirect_to root_path
  end

end