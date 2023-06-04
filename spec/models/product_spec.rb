require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) do
    @category = Category.new({ name: 'Tree' })
    @product = Product.new({ name: "Maple", price_cents: 3000, quantity: 37, category: @category })
  end

  describe 'Validations' do

    it 'should validate the presence of name' do
      expect(@product.name).not_to be(nil)
    end
    it 'should validate the presence of price' do
      expect(@product.price_cents).not_to be(nil)
    end
    it 'should validate the presence of quantity' do
      expect(@product.quantity).not_to be(nil)
    end
    it 'should validate the presence of category' do
      expect(@product.category).not_to be(nil)
    end
  end
end
