require 'spec_helper'

describe User do
  
  before { @user = User.new(name: "Example User", email: "user@example.com", netid: "xyz89", cardnumber: "999999999") }
  
  subject { @user }
  
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:netid) }
  it { should respond_to(:cardnumber) }
  
  it { should be_valid }
  
  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end
  
  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end
  
  describe "when netid is not present" do
    before { @user.netid = " " }
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
  
  describe "when netid is already taken" do
    before do
      user_with_same_netid = @user.dup
      user_with_same_netid.netid = @user.netid.upcase
      user_with_same_netid.save
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
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  netid      :string(255)
#  cardnumber :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

