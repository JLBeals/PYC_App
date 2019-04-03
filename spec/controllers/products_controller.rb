require 'rails_helper'

describe ProductsController, type: :controller do

  let(:product) { Product.create!(name: "yoga pass") }
  let(:user) {User.create!(first_name: "Jill", last_name: "Smith", email: "test4@gmail.com", password: "123456") }

  context 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  context 'GET #show' do
    it 'renders the show template' do
      get :show, params: { id: user.id }
      expect(response).to be_ok
      expect(response).to render_template('show')
    end
  end

  context 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to be_ok
      expect(response).to render_template('new')
    end
  end

  context 'GET #edit' do
    it 'renders the edit template' do
      get :edit, params: { id: user.id }
      expect(response).to be_ok
      expect(response).to render_template('edit')
    end
  end

  context 'POST #create' do
    before do
      sign_in user
    end
    it 'creates a product' do
      expect(response).to be_successful
    end
  end

  context 'PUT #update' do
    before do
      sign_in user
    end
    it 'updates a product' do
      expect(response).to be_successful
    end
  end

  context 'DELETE #destroy' do
    before do
      sign_in user
    end
    it 'deletes a product' do
      expect(response).to be_successful
    end
  end




end
