require 'rails_helper'

RSpec.describe Product, type: :model do
  category = Category.new

  describe 'Validations' do
    context "product can save" do
      it "should be vaild" do
        product = Product.new(name: "test", quantity: 10, price: 10000, category: category)
        expect(product.validate).to be true
      end
    end

    context "when product name is missing" do
      it "should be invaild" do
        product = Product.new(quantity: 10, price: 10000, category: category)
        expect(product).to_not be_valid
        expect(product.errors.full_messages.include?("Name can't be blank")).to be true 
      end
    end

    context "when product price is missing" do
      it "should be invaild" do
        product = Product.new(name: 'test', quantity: 10, category: category)
        expect(product).to_not be_valid
        expect(product.errors.full_messages.include?("Price can't be blank")).to be true
      end
    end

    context "when quantity is missing" do
      it "should be invaild" do
        product = Product.new(name: 'test', price: 10000, category: category)
        expect(product).to_not be_valid
        expect(product.errors.full_messages.include?("Quantity can't be blank")).to be true
      end
    end

    context "when category is missing" do
      it "should be invaild" do
        product = Product.new(name: 'test', quantity: 10, price: 10000)
        expect(product).to_not be_valid
        expect(product.errors.full_messages.include?("Category can't be blank")).to be true  
      end
    end
  end
end
