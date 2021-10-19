require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    context "give filled out correctly" do
      it "should be vaild" do
        user = User.create(first_name: "John", last_name: "Smith", email: "test@test.com", password: "123456", password_confirmation: "123456")
        expect(user).to be_valid
      end
    end

    context "given password and password_confirmation are blank" do
      it "should be invaild" do
        user = User.create(first_name: "John", last_name: "Smith", email: "test@test.com", password: "", password_confirmation: "")
        expect(user).to_not be_valid
      end
    end

    context "given password does not match password_confirmation" do
      it "should be invaild" do
      user = User.create(first_name: "John", last_name: "Smith", email: "test@test.com", password: "123456", password_confirmation: "987456")
      expect(user).to_not be_valid
      end
    end

    context "emails must be unique" do
      it "user1 should be vaild while user2 is invaild" do
      user1 = User.create(first_name: "John", last_name: "Smith", email: "test@test.com", password: "123456", password_confirmation: "123456")
      user2 = User.create(first_name: "John", last_name: "Smith", email: "test@test.com", password: "123456", password_confirmation: "123456")
      expect(user1).to be_valid
      expect(user2).to_not be_valid 
      end
    end

    context "email should not be blank" do
      it "should be invaild" do
        user = User.create(first_name: "John", last_name: "Smith", email: "", password: "123456", password_confirmation: "123456")
        expect(user).to_not be_valid
      end
    end

    context "first_name should not be blank" do
      it "should be invaild" do
        user = User.create(first_name: "", last_name: "Smith", email: "", password: "123456", password_confirmation: "123456")
        expect(user).to_not be_valid
      end
    end

    context "last_name should not be blank" do
      it "should be invaild" do
        user = User.create(first_name: "John", last_name: "", email: "", password: "123456", password_confirmation: "123456")
        expect(user).to_not be_valid
      end
    end

    context "given password to short" do
      it "should be invaild" do
        user = User.create(first_name: "John", last_name: "", email: "", password: "123", password_confirmation: "123")
        expect(user).to_not be_valid
      end
    end

  end

  describe 'authenticate_with_credentials' do

    context "when email and password are vaild" do
      it "should be vaild" do
        user = User.create(first_name: "John", last_name: "Smith", email: "test@test.com", password: "1234567", password_confirmation: "1234567")
        expect(User.authenticate_with_credentials('test@test.com', "1234567")).to eq user
      end
    end

    context "when email has extra blank spaces at the begining and end" do
      it "should be vaild" do
        user = User.create(first_name: "John", last_name: "Smith", email: "test@test.com", password: "1234567", password_confirmation: "1234567")
        expect(User.authenticate_with_credentials('    test@test.com    ', "1234567")).to eq user
      end
    end

    context "when email has uppercase letters" do
      it "should be vaild" do
        user = User.create(first_name: "John", last_name: "Smith", email: "test@test.com", password: "1234567", password_confirmation: "1234567")
        expect(User.authenticate_with_credentials('tESt@tEST.cOm', "1234567")).to eq user
      end
    end
  end
end
