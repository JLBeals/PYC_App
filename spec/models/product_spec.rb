require 'rails_helper'

describe Product do
  context "when the product has comments" do
      let(:product) { Product.create!(name: "yoga pass") }
      # let(:user) {User.create!(email: "test4@gmail.com", password: "123456789") }
      let(:user) { FactoryBot.create(:user) }

    before do
      product.comments.create!(rating: 1, user: user, body: "Bleh")
      product.comments.create!(rating: 3, user: user, body: "Okay")
      product.comments.create!(rating: 5, user: user, body: "Love")
    end

    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq 3
    end

  end

  context "a product with no name, no description, or no price is invalid" do

    it "returns that the product is invalid without a name" do
      expect(Product.new(description: "Cool Pass")).not_to be_valid
    end

    it "returns that the product is invalid without a description" do
      expect(Product.new(description: nil)).not_to be_valid
    end

    it "returns that the product is invalid without a price" do
      expect(Product.new(price: nil)).not_to be_valid
    end
  end

  context "when a user searches for a product with a certain name" do

    let!(:product) { Product.create!(name: "beginner pass") }

    it "returns the product with that name" do
      expect(Product.search("beginner").first).to eq product
    end

    it "does not return the product with that name" do
      expect(Product.search("advance").first).not_to eq product
    end

  end

end
