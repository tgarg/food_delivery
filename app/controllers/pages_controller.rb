class PagesController < ApplicationController

  def home
		@title = "Duke Delivery"
  end

  def about
		@title = "Duke Delivery | About Us"
  end

  def contact
		@title = "Duke Delivery | Contact Us"
  end

  def faq
		@title = "Duke Delivery | FAQ"
  end
end
