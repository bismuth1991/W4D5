require 'rails_helper'

RSpec.describe Goal, type: :model do
  subject(:goal) { FactoryBot.create(:goal) }
  before(:each) do
    FactoryBot.create(:user)
  end

  describe 'validations' do
    it { should validate_presence_of(:body)}
    it { should validate_presence_of(:user_id)}
    it { should belong_to(:user) }

    it 'should be public by default' do
      expect(goal.public).to be(true)
    end

    it 'should not be completed by default' do
      expect(goal.completed).to be(false)
    end

  end
end
