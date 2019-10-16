require 'rails_helper'

describe 'visitor visits about page' do
  it 'can view about page' do

    visit about_path

    expect(page).to have_content("Turing Tutorials")
  end
end
