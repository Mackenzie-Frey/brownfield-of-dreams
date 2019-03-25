require 'rails_helper'

context 'As a (non-registered) visitor' do
  it 'cannot see tutorials marked as classroom content' do
    tutorial1 = create(:tutorial, classroom: false)
    tutorial2 = create(:tutorial, classroom: true)

    create(:video, tutorial_id: tutorial1.id)
    create(:video, tutorial_id: tutorial2.id)

    visit root_path

    within '.tutorials' do
      expect(page).to have_content(tutorial1.title)
      expect(page).to_not have_content(tutorial2.title)
    end

    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    within '.tutorials' do
      expect(page).to have_content(tutorial1.title)
      expect(page).to have_content(tutorial2.title)
    end
  end
end
