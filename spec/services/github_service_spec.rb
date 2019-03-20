require 'rails_helper'

describe GithubService do
  before :each do
    @user = create(:user, github_token: ENV['GITHUB_API_KEY'])
  end

  it "exists" do
    service = GithubService.new(@user.github_token)

    expect(service).to be_a(GithubService)
  end

  describe "Instance Methods" do
    it "#get_repos" do
      VCR.use_cassette("services/get_repos") do
        repos = GithubService.new(@user.github_token).get_repos

        expect(repos[0]).to be_a(Hash)
        expect(repos[0]).to have_key(:name)

        expect(repos[0][:name]).to eq("activerecord-obstacle-course")
        expect(repos[1][:name]).to eq("apollo_14")
        expect(repos[2][:name]).to eq("backend_prework")
        expect(repos[3][:name]).to eq("battleship")
        expect(repos[4][:name]).to eq("books")
      end
    end

    it "#get_followers" do
      VCR.use_cassette("services/get_followers") do
        followers = GithubService.new(@user.github_token).get_followers

        expect(followers[0]).to be_a(Hash)
        expect(followers[0]).to have_key(:login)

        expect(followers[0][:login]).to eq("nagerz")
        expect(followers[1][:login]).to eq("Mackenzie-Frey")
        expect(followers[2][:login]).to eq("MaryBork")
        expect(followers[3][:login]).to eq("TyMazey")
        expect(followers[4][:login]).to eq("plapicola")
        expect(followers[5][:login]).to eq("PeregrineReed")
        expect(followers[6][:login]).to eq("juliamarco")
      end
    end
  end
end
