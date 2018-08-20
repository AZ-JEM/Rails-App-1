require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  # @user = FactoryBot.create(:user)
  let(:user) { User.create!( email: "user1@mail.app", first_name: "User", last_name: "Persona", password: "abc123" ) }
  let(:product) { Product.create!(name: "Widget", description: "Widget description...", price: 0.50) }

  # index
  describe 'GET #index' do

    context 'when a user is logged in' do
      before do
        sign_in user
      end
      it 'displays orders' do
        get :index
        expect(response).to render_template('index');
      end
    end

    context 'when a user is not logged in' do
      before do
        sign_out user
      end
      it 'redirects to login' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  # show
  describe 'GET #show' do

    let(:order) { Order.create!(user_id: user.id, product_id: product.id, total: product.price) }

    context 'authenticated' do
      before do
        sign_in user
      end
      it 'displays order detail' do
        get :show, params: { id: order.id }
        expect(response).to render_template('show');
      end
    end

    context 'visitor' do
      before do
        sign_out user
      end
      it 'redirects to login' do
        get :show, params: { id: order.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

end
