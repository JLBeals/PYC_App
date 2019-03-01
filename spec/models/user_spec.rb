require 'rails_helper'

describe User do
  context "first name, last name, and e-mail are present" do
    let(:user) {User.create!(first_name: "Jill", last_name: "Smith", email: "test4@gmail.com", password: "123456") }

    it "user has a first name" do
      expect(user.first_name).to eq "Jill"
    end

    it "user has alast name" do
      expect(user.last_name).to eq "Smith"
    end

    it "user has a valid e-mail" do
      expect(user.email).to eq "test4@gmail.com"
    end
  end
end
