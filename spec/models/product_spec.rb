require 'rails_helper'

describe Product do
  context "when the product has comments" do
      let(:product) { Product.create!(name: "yoga pass") }
      # let(:user) {User.create!(email: "test4@gmail.com", password: "123456789") }
      @user = FactoryBot.create(:user)

    before do
      product.comments.create!(rating: 1, user: @user, body: "Bleh")
      product.comments.create!(rating: 3, user: @user, body: "Okay")
      product.comments.create!(rating: 5, user: @user, body: "Love")
    end

    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq 3
    end

  end

  context "a product with no name is invalid" do

    it "returns that the product is invalid without a name" do
      expect(Product.new(description: "Cool Pass")).not_to be_valid
    end
  end
end
