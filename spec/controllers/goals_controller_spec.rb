require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  describe "GET#new" do
    it "renders create goal template" do
      get :new
      
      expect(response).to render_template(:new)
    end
  end

  describe "POST#create" do

    context "with valid arguments" do
      it "successfully saves goal" do
        post :create, params: { goal: { body: "Hello!"}, user_id: user.id}

        expect(user.goals.last).to eq(goal)
      end
    end

    context "with invalid arguments" do
      it "errors are stored" do
        post :create, params: { goal: { body: ""}, user_id: user.id }

        expect(flash[:errors]).to be_present
      end
    end

  end
end
