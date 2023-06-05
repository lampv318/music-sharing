require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    subject { get :index }
    let!(:shared_video) { create(:shared_video) }

    it 'should have @shared_video at home page' do
      subject
      expect(SharedVideo.all.order(id: "DESC").pluck(:id)).to eq controller.instance_variable_get(:@shared_videos).pluck(:id)
    end
  end
end
