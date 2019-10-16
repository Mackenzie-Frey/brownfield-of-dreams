require 'rails_helper'

RSpec.describe GithubUser, type: :model do

  describe 'attributes' do
    it 'has attributes' do
      hash = {id: 1234, login: "avery", html_url: "http://", email: "a@gmail.com"}
      gh_user = GithubUser.new(hash)

      expect(gh_user.github_id).to eq(1234)
      expect(gh_user.login).to eq("avery")
      expect(gh_user.html_url).to eq("http://")
      expect(gh_user.email).to eq("a@gmail.com")
    end
  end

  describe 'methods' do
    it 'can show add friends' do
      hash = {id: 1234, login: "avery", html_url: "http://", email: "a@gmail.com"}
      gh_user = GithubUser.new(hash)
      user = create(:user)

      expect(gh_user.show_add_friend_button?).to eq(nil)
    end
    it 'can find users' do
      hash = {id: 1234, login: "avery", html_url: "http://", email: "a@gmail.com"}
      gh_user = GithubUser.new(hash)
      user = create(:user, github_id: 1234)

      expect(gh_user.user?).to eq(user)
    end
    it 'can find if friends have been added' do
      hash = {id: 1234, login: "avery", html_url: "http://", email: "a@gmail.com"}
      gh_user = GithubUser.new(hash)
      user = User.create!(email: "a", first_name: "a", password_digest: "a", github_id: 1234)

      expect(gh_user.not_already_added?).to eq(true)
    end
    it 'can tell if email present' do
      hash = {id: 1234, login: "avery", html_url: "http://", email: ""}
      gh_user = GithubUser.new(hash)

      expect(gh_user.email?).to eq(false)
    end
    it 'can tell if login exists' do
      hash = {id: nil, login: "avery", html_url: "http://", email: ""}
      gh_user = GithubUser.new(hash)

      expect(gh_user.not_exist?).to eq(true)
    end
  end
end
