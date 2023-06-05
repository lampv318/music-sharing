require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:email).is_at_most(255) }
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(50) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe 'associations' do
    it { have_many(:shared_videos) }
  end

  describe '#downcase_email' do
    let(:user) { User.new(name: 'test', email: 'TEST@test.com', password: '123456') }

    it 'email should be downcase when is saved' do
      user.save!
      expect(user.email).to eq 'test@test.com'
    end
  end
end
