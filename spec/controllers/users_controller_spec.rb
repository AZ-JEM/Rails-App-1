require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  user = FactoryBot.create(:user)
  # let(:user)   { User.create!( email: "user@mail.com", first_name: "User", last_name: "Persona", password: "abc123" ) }
  # let(:hacker) { User.create!( email: "hacker@mail.app", first_name: "Disruptive", last_name: "Persona", password: "abc123" ) }

  # generated
  # describe "GET #index" do
  #   it "returns http success" do
  #     get :index
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "GET #show" do

    context 'when a user is logged in' do
      before do
        puts '*' * 100
        puts user.inspect
        puts '*' * 100
        sign_in user
      end
      it 'loads user details' do
        get :show, params: { id: user.id }
        expect(response).to be_ok
        # expect(assigns(:user)).to eq user
      end
    end

    context 'when a user is not logged in' do
      before do
        puts '*' * 100
        puts user.inspect
        puts '*' * 100
        sign_out user
      end
      it 'redirects to login' do
        get :show, params: { id: user.id }
        expect(response).to be_ok
        # expect(response).to redirect_to(new_user_session_path)
      end
    end

    # generated
    # it "returns http success" do
    #   get :show
    #   expect(response).to have_http_status(:success)
    # end
  end

end
