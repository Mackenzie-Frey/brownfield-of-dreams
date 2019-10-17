require 'rails_helper'

describe 'visitor visits get started page' do
  it 'can view get started page' do

    visit get_started_path

    expect(page).to have_content("Get Started")
    expect(page).to have_content("Browse tutorials from the homepage.")
  end
end
