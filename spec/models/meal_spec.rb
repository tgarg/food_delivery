require 'spec_helper'

describe Meal do
  
  let(:restaurant) { FactoryGirl.create(:restaurant) }
	before { @meal = restaurant.meals.build(name: "Fried Rice", price: 10.95) }

	subject { @meal }

	it { should respond_to :name }
	it { should respond_to :price }
	it { should respond_to :restaurant_id }
	it { should respond_to :restaurant }
	its(:restaurant) { should == restaurant }

	it { should be_valid }


  describe "accessible attributes" do
    it "should not allow access to restaurant_id" do
      expect do
        Meal.new(restaurant_id: restaurant.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

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
#  id            :integer         not null, primary key
#  name          :string(255)
#  price         :decimal(, )
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#  restaurant_id :integer
#

