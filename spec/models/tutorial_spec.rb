# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tutorial, type: :model do
  describe 'class methods' do
    it 'open_content' do
      tut_1 = create(:tutorial, classroom: false)
      tut_2 = create(:tutorial, classroom: true)

      expect(Tutorial.open_content).to eq([tut_1])
    end
  end
end
