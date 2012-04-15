require 'spec_helper'

describe "Restaurant pages" do

	subject { page }
	
	describe "restaurant show page" do
	  let(:restaurant) { FactoryGirl.create(:restaurant) }
    before { visit restaurant_path(restaurant) }
    
    it { should have_selector('h1', text: restaurant.name) }
  end

  describe 'add restaurant page' do

		before { visit adnew_path }

		describe 'with invalid information' do
			it 'should not create a new restaurant' do
				expect { click_button "Add to database" }.not_to change(Restaurant, :count)
			end
		end

		describe "with valid information" do
			it "should create a new restaurant entry" do
				fill_in "Name",       			with: "MickyDs"
				fill_in "Description",			with: "Terrible hamburgers"
				expect { click_button "Add to database"}.to change(Restaurant, :count).by(1)
			end
		end
  end
end