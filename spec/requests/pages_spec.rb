require 'spec_helper'

describe "Pages" do
	describe 'Home page' do
		
		it "should have content 'Campus Dish'" do
			visit root_path
			response.should have_content('Campus Dish')
		end
	end
end
