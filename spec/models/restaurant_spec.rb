require 'spec_helper'

describe Restaurant do
  
	before { @restaurant = Restaurant.new(name: "Chipotle", description: "Mexican McDonalds") }

	subject { @restaurant }

	it { should respond_to(:name) }
	it { should respond_to(:description) }
	it { should respond_to(:meals) }

	it { should be_valid }

	describe "validations require that" do
		
		describe "the name shouldn't be blank" do
			before { @restaurant.name = " "}
			it { should_not be_valid }
		end

		describe "the name shouldn't be nil" do
			before { @restaurant.name = nil }
			it { should_not be_valid }
		end

		describe "the name shouldn't be longer than 50 characters" do
			before { @restaurant.name = "a" * 51}
			it {should_not be_valid }
		end

		describe "the description shouldn't be blank" do
			before { @restaurant.description = " "}
			it { should_not be_valid }
		end

		describe "the description shouldn't be nil" do
			before { @restaurant.description = nil }
			it { should_not be_valid }
		end
	end
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

