require 'rails_helper'

describe UsersController, type: :controller do
  # let(:user) { User.create!(email: "test4@gmail.com", password: "123456789")}
  # let(:user_2) { User.create!(email: "test5@gmail.com", password: "123456")}
  before do
    @user = FactoryBot.create(:user)
    @user_2 = FactoryBot.create(:user)
  end

  describe 'GET #show' do
    context 'when a user is logged in' do

      before do
        sign_in @user
      end

      it 'loads correct user details' do
        get :show, params: { id: @user.id }
        expect(assigns(:user)).to eq @user
      end

    end

    context 'when a user is not logged in' do
      it 'redirects to login' do
        get :show, params: { id: @user.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end


    context 'when a user tries to log into another users page' do

      before do
        sign_in @user_2
      end

      it 'redirects to login' do
        get :show, params: { id: @user.id }
        expect(response).to redirect_to(root_path)
      end
    end

#probably unnecessary, but I wanted to check the logic behind these tests to make sure I understand
    context 'when the second user tries to log into the first users page' do

      before do
        sign_in @user
      end

      it 'redirects to login' do
        get :show, params: { id: @user_2.id }
        expect(response).to redirect_to(root_path)
      end
    end

  end

end
