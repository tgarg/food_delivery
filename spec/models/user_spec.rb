require 'spec_helper'

describe User do
  
  before { @user = User.new(name: "Example User", email: "user@example.com",
                            cardnumber: "999999999", password: "asdfgh",
                            password_confirmation: "asdfgh") }
  
  subject { @user }
  
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:cardnumber) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }
  
  it { should be_valid }

  describe "authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }

    describe "should return the user object with a valid password" do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "should reject an invalid password" do
      let(:user_with_invalid_pass) { found_user.authenticate("invalid") }
      it { should_not == user_with_invalid_pass}
      specify { user_with_invalid_pass.should be_false }
    end
  end

  describe "should not have a password less than 6 charaters" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should_not be_valid }
  end

  describe "should not have a nil password_confirmation" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end

  describe "should not have a blank password" do
    before { @user.password = @user.password_confirmation = " "}
    it { should_not be_valid }
  end

  describe "should have a matching pass/confirmation" do
    before { @user.password = "fdsa" }
    it { should_not be_valid }
  end
  
  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end
  
  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end
  
  describe "when cardnumber is not present" do
    before { @user.cardnumber = " " }
    it { should_not be_valid }
  end
  
  describe "when name is too long" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end
  
  describe "when cardnumber is invalid" do
    invalid_cardnumbers = %w[1234567 1234567890 ab1234567]
    invalid_cardnumbers.each do |invalid_cardnumber|
      before { @user.cardnumber = invalid_cardnumber }
      it { should_not be_valid }
    end
  end
  
  describe "when cardnumber is valid" do
    valid_cardnumbers = %w[123456789 000000000 771253707]
    valid_cardnumbers.each do |valid_cardnumber|
      before { @user.cardnumber = valid_cardnumber }
      it { should be_valid }
    end
  end
  
  describe "when email format is invalid" do
    invalid_addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    invalid_addresses.each do |invalid_address|
      before { @user.email = invalid_address }
      it { should_not be_valid}
    end
  end
  
  describe "when email format is valid" do
    valid_addresses = %w[user@foo.com user_at@foo.o.org example.user@foo.edu]
    valid_addresses.each do |valid_address|
      before { @user.email = valid_address }
      it { should be_valid}
    end
  end
  
  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
    
    it { should_not be_valid }
  end
  
  describe "when duke cardnumber is already taken" do
    before do
      user_with_same_cardnumber = @user.dup
      user_with_same_cardnumber.save
    end
    
    it { should_not be_valid }
  end
end
# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  email           :string(255)
#  cardnumber      :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#

