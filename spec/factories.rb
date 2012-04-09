FactoryGirl.define do
  factory :user do
    name     "Example User"
    email    "user@example.com"
    password "foobar"
    password_confirmation "foobar"
    cardnumber "999999999"
  end

  factory :restaurant do
		name				"McDonalds"
		description "There is a fine ass white girl outside my window right now."
  end

  factory :meal do
    name    "Fried Rice"
    price   "8.95"
    restaurant
  end
end