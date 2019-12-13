require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do 
    @user = FactoryBot.create(:user)    
  end

  it "has a valid factory" do
    # teste toujours tes factories pour voir si elles sont valides
    expect(build(:user)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
    end

    describe "#first_name" do
      it { expect(@user).to validate_presence_of(:first_name) }
    end

    describe "#last_name" do
      it { expect(@user).to validate_presence_of(:last_name) }
    end

    describe "#username" do
      it { expect(@user).to validate_length_of(:username).is_at_least(3) }
    end

  end

  context "associations" do

    describe "books" do
      it { expect(@user).to have_many(:books) }
    end

  end

  context "public instance methods" do

    describe "#full_name" do

      it "should return a string" do
        expect(@user.full_name).to be_a(String)
      end

      it "should return the full name" do
        expect(@user.full_name).to eq("John Doe")
        user_2 = create(:user, first_name: "Jean-Michel", last_name: "Durant")
        expect(user_2.full_name).to eq("Jean-Michel Durant")
      end
    end

  end

end