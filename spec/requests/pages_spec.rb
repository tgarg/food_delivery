require 'spec_helper'

describe "Pages" do

	describe 'Home page' do

		it "should have the right title" do
			visit root_path
			page.should have_selector('title', :text => "Duke Delivery")
		end
	end

	describe 'About page' do
		
	end

	describe 'Contact page' do
		
	end

	describe 'FAQ page' do
		
	end
end
