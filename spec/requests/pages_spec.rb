require 'spec_helper'

describe "Pages" do

	describe 'Home page' do

		it "should have the title 'Duke Delivery" do
			visit root_path
			page.should have_selector('title', :text => "Duke Delivery")
		end
	end

	describe 'About page' do

		it "should have the correct title" do
			visit '/about'
			page.should have_selector('title', :text => "Duke Delivery | About Us")			
		end
	end

	describe 'Contact page' do

		it "should have the correct title" do
			visit '/contact'
			page.should have_selector('title', :text => "Duke Delivery | Contact Us")
		end
	end

	describe 'FAQ page' do
		
		it "should have the correct title" do
			visit '/faq'
			page.should have_selector('title', :text => "Duke Delivery | FAQ")
		end
	end
end
