require 'rails_helper'

describe "As a registered user" do
  describe "I see a button to connect my github account" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_button("Connect to Github")
  end
end
