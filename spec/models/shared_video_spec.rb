require 'rails_helper'

RSpec.describe SharedVideo do
  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:title) }
  end

  describe 'associations' do
    it { belong_to(:shared_videos) }
  end

  context 'callbacks check' do
    it { is_expected.to callback(:send_notification).after(:create) }
  end
end
