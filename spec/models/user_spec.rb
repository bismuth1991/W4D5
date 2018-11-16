require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { FactoryBot.create(:user) }

  describe "Validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }

    it 'should have session token before being saved into database' do
      expect(user.session_token).to be_present
    end
  end

  describe "::find_by_credentials" do
    context "with valid credentials" do
      it 'returns the correct user' do
        user1 = User.create(username: 'Test', password: 'password')
        found_user = User.find_by_credentials('Test', 'password')

        expect(found_user).to eq(user1)
      end
    end

    context "with invalid credentials" do
      it 'returns nil' do
        found_user = User.find_by_credentials('Test1', 'password')

        expect(found_user).to eq(nil)
      end
    end
  end
end
