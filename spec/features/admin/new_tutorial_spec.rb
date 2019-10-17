# frozen_string_literal: true

require 'rails_helper'

describe 'An Admin can do things to tutorial' do
  it 'create' do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_tutorial_path
    click_on 'Save'

    expect(page).to have_content("Title can't be blank, Description can't be blank, and Thumbnail is an invalid URL")

    fill_in 'tutorial[title]', with: 'How to tie your shoes.'
    fill_in 'tutorial[description]', with: 'Over, under, around and through, Meet Mr. Bunny Rabbit, pull and through.'
    fill_in 'tutorial[thumbnail]', with: 'J7ikFUlkP_k'

    click_on 'Save'
    expect(page).to have_content("Thumbnail is an invalid URL")

    fill_in 'tutorial[title]', with: 'How to tie your shoes.'
    fill_in 'tutorial[description]', with: 'Over, under, around and through, Meet Mr. Bunny Rabbit, pull and through.'
    fill_in 'tutorial[thumbnail]', with: 'https://i.ytimg.com/vi/R5FPYQgB6Zc/hqdefault.jpg'

    click_on 'Save'

    tutorial = Tutorial.last
    expect(tutorial.title).to eq('How to tie your shoes.')
  end
end
