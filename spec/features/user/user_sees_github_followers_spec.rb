require 'rails_helper'

describe "As a registered user" do
  it "I see all my followers" do
    user = create(:user, email: "april@email.com", password: "test", github_token: ENV['GITHUB_API_KEY'])
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    VCR.use_cassette("services/get_repos") do
      VCR.use_cassette("services/get_followers") do

        visit dashboard_path

        within ".followers" do
          expect(page).to have_link("nagerz")
          expect(page).to have_link("Mackenzie-Frey")
          expect(page).to have_link("MaryBork")
          expect(page).to have_link("TyMazey")
          expect(page).to have_link("plapicola")
        end
      end
    end
  end
end
