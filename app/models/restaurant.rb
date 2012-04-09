class Restaurant < ActiveRecord::Base
	attr_accessible(:name, :description)

	validates :name, presence: true, length: { maximum: 50 }
	validates :description, presence: true
end
# == Schema Information
#
# Table name: restaurants
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

