# frozen_string_literal: true

require 'rails_helper'

describe 'An admin visiting the admin dashboard' do
  it 'can see all tutorials' do
    admin = create(:admin)
    create_list(:tutorial, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit '/admin/dashboard'

    expect(page).to have_css('.admin-tutorial-card', count: 2)
  end
  it 'can see delete tutorial' do
    admin = create(:admin)
    tut_2 = create(:tutorial, title: "longlongtitle")
    tut_1 = create(:tutorial)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit '/admin/dashboard'

    expect(page).to have_css('.admin-tutorial-card', count: 2)

    within(first('.admin-tutorial-card')) do
      click_on("Destroy")
    end
    expect(page).to_not have_content("longlongtitle")

  end
end
