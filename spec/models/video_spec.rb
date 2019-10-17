# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Video, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
  end

  describe 'relationships' do
    it { should have_many :user_videos }
    it { should belong_to :tutorial }
    it { should have_many(:users).through(:user_videos) }
  end

  describe 'class methods' do
    it 'videos_by_tutorial' do
      tutorial_1 = create(:tutorial, title: "title_1")
        video_2 = create(:video, title: "video_2", position: 2, tutorial_id: tutorial_1.id)
        video_3 = create(:video, title: "video_3", position: 3, tutorial_id: tutorial_1.id)
        video_1 = create(:video, title: "video_1", position: 1, tutorial_id: tutorial_1.id)


      tutorial_2 = create(:tutorial, title: "title_2")
        video_4 = create(:video, title: "video_4", position: 1, tutorial_id: tutorial_2.id)
        video_5 = create(:video, title: "video_5", position: 2, tutorial_id: tutorial_2.id)
        video_6 = create(:video, title: "video_6", position: 3, tutorial_id: tutorial_2.id)

      expect(Video.vidoes_by_tutorial[3]).to eq([video_1, video_2, video_3])
    end
  end

end
