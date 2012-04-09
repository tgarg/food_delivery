class Meal < ActiveRecord::Base

# having issues getting this REGEX to work properly, Rubular says its fine
# but the test suite isn't passing. Either the test is written incorrectly,
# or theres something wrong here

	VALID_PRICE_REGEX = /\d{1,}[.]\d{2}/
	validates :name, presence: true, length: { maximum: 50 }
	validates :price, presence: true, format: { with: VALID_PRICE_REGEX }
end
# == Schema Information
#
# Table name: meals
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  price      :decimal(, )
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

