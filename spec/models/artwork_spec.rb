require 'rails_helper'

RSpec.describe TonModel, type: :model do

  before(:each) do 
  # en général, tu as envie de créer une nouvelle instance
  end



  context "validations" do

    it "is valid with valid attributes" do
      # création qui est valide
    end

    describe "#some_attribute" do
      # teste cet attribut, en fonction de la validation que tu lui as donnée
    end

  end

  context "associations" do

    describe "some association" do
      # teste cette association
    end

  end

  context "callbacks" do

    describe "some callbacks" do
      # teste ce callback
    end

  end

  context "public instance methods" do

    describe "#some_method" do
      # teste cette méthode
    end

  end

  context "public class methods" do

    describe "self.some_method" do
      # teste cette méthode
    end

  end

end