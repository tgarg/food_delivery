class User < ActiveRecord::Base
  attr_accessible :name, :email, :netid, :cardnumber
  
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_CARDNUMBER_REGEX = /\d{9}/
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
            uniqueness: { case_sensitive: false }
  validates :netid, presence: true, uniqueness: { case_sensitive: false }
  validates :cardnumber, presence: true, format: { with: VALID_CARDNUMBER_REGEX },
            length: { is: 9 }, uniqueness: { case_sensitive: false }
  
  #test suite was passing even without case_sensitive argument...
end
# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  netid      :string(255)
#  cardnumber :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

