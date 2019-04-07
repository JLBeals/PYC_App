require 'rails_helper'

describe Comment do
  context "when a user creates a comment a rating, user id, product id, and body are present" do
      let(:product) { Product.create!(name: "yoga pass") }
      let(:user) { FactoryBot.create(:user) }

    it "when the comment has no rating it's invalid" do
      expect(Comment.new(rating: nil, body: "awesome", user_id: "1", product_id: "1")).not_to be_valid
    end

    it "when the comment has no body it's invalid" do
      expect(Comment.new(rating: "4", body: nil, user_id: "1", product_id: "1")).not_to be_valid
    end

    it "when the comment has no name it's invalid" do
      expect(Comment.new(rating: "4", body: "awesome", user_id: nil, product_id: "1")).not_to be_valid
    end

    it "when the comment has no product id it's invalid" do
      expect(Comment.new(rating: "4", body: "awesome", user_id: "1", product_id: nil)).not_to be_valid
    end
  end

end
