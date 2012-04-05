class Product < ActiveRecord::Base
  attr_accessible :description, :price, :title, :image_url, :on_sale, :category_ids
  has_many :categories, :through => :category_products
  has_many :category_products
  validates_presence_of :categories, :description, :title, :price
  validate :categories_valid?

  def categories_valid?
    unless self.categories && self.categories.any?
      errors[:base] << "Please pick a category, homeslice."
    end
  end
end
# == Schema Information
#
# Table name: products
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  price       :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  image_url   :string(255)
#  on_sale     :boolean
#

