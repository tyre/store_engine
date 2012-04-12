class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :email, :password, :name, :display_name

  has_one :customer
  has_many :orders
  has_one :cart

  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email


  

  def is_admin?
    is_admin
  end
end
# == Schema Information
#
# Table name: users
#
#  id                              :integer         not null, primary key
#  email                           :string(255)
#  crypted_password                :string(255)
#  salt                            :string(255)
#  is_admin                        :boolean         default(FALSE)
#  name                            :string(255)
#  created_at                      :datetime        not null
#  updated_at                      :datetime        not null
#  reset_password_token            :string(255)
#  reset_password_token_expires_at :datetime
#  reset_password_email_sent_at    :datetime
#  remember_me_token               :string(255)
#  remember_me_token_expires_at    :datetime
#  on_sale                         :boolean
#

