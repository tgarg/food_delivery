require 'spec_helper'

describe Meal do
  
	before { @meal = Meal.new(name: "Fried Rice", price: 10.95) }

	subject { @meal }

	it { should respond_to :name }
	it { should respond_to :price }

	it { should be_valid }

	describe "validations should require" do
		
		describe "name should not be blank" do
			before { @meal.name = " " }
			it { should_not be_valid }
		end

		describe "name should not be nil" do
			before { @meal.name = nil }
			it { should_not be_valid }
		end

		describe "price should not be blank" do
			before { @meal.price = " "}
			it { should_not be_valid }
		end

		describe "price should not be nil" do
			before { @meal.price = nil }
			it { should_not be_valid }
		end

		describe "price should not be invalid" do
			invalid_prices = %w[.97 10.560]
			invalid_prices.each do |p|
				before { @meal.price = p }
				it { should_not be_valid }
			end
		end
	end
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

