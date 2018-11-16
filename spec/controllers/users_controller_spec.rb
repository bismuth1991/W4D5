require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET#new" do
    it "renders sign up page" do
      get :new

      expect(response).to render_template(:new)
    end
  end

  describe "POST#create" do
    context "with valid username and password" do
      it 'logs in the user' do
        post :create, params: {
          user: {username: 'username', password: 'password' }
        }
        user = User.find_by(username: 'username')

        expect(user.session_token).to eq(session[:session_token])
      end

      it "creates a new user and redirects to show page" do
        post :create, params: {
          user: {username: 'username', password: 'password' }
        }
        user = User.find_by(username: 'username')

        expect(user).to_not be_nil
        expect(response).to redirect_to user_url(user)
      end
    end

    context "with invalid username or password" do
      it "redirects to sign up page and saves erors" do
        post :create, params: {
          user: {username: 'username', password: 'pass' }
        }

        expect(response).to redirect_to new_user_url
        expect(flash[:errors]).to_not be_empty
      end
    end
  end

end
