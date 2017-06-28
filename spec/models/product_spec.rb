require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '.alphabetical' do
    it "returns [] when there are no products" do
      expect(Product.alphabetical).to eq []
    end

    it 'returns [a] when there is only one product a' do
      my_product = Product.create(
        name: 'Nón lá',
        description: 'A wonderful conical hat that forms a perfect right circular cone which tapers smoothly from the base to the apex',
        image_path: 'non.jpg',
        price_vnd: 20000.0,
        weight: 100
      )
      expected_result = [my_product]
      expect(Product.alphabetical).to eq expected_result
    end
    it "returns [a,b,c] after I create 3 products c, b, a" do
      product_C = Product.create(
        name: 'C',
        description: 'A wonderful conical hat that forms a perfect right circular cone which tapers smoothly from the base to the apex',
        image_path: 'non.jpg',
        price_vnd: 20000.0,
        weight: 100
      )
      product_B = Product.create(
        name: 'B',
        description: 'A wonderful conical hat that forms a perfect right circular cone which tapers smoothly from the base to the apex',
        image_path: 'non.jpg',
        price_vnd: 20000.0,
        weight: 100
      )
      product_A = Product.create(
        name: 'A',
        description: 'A wonderful conical hat that forms a perfect right circular cone which tapers smoothly from the base to the apex',
        image_path: 'non.jpg',
        price_vnd: 20000.0,
        weight: 100
      )
      actual_result = Product.alphabetical
      expect(actual_result).to eq [product_A, product_B, product_C]
    end
  end
end
