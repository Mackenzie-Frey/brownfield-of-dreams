require 'rails_helper'

describe 'As a registered user visiting the dashboard' do
  it 'I can send an email invite', :vcr do
    april = create(:user, email: "test@email.com", password: "test", github_token: ENV['GITHUB_API_KEY'], github_uid: "41272635", github_handle: 'aprildagonese', github_url: 'https://github.com/aprildagonese')
    invite_github_handle1 = 'Mackenzie-Frey'
    invite_github_handle2 = 'nagerz'

    repos_json_response = File.open('fixtures/user_repos.rb')
    stub_request(:get, "https://api.github.com/user/repos").to_return(status: 200, body: repos_json_response)

    followers_json_response = File.open('fixtures/user_followers.rb')
    stub_request(:get, "https://api.github.com/user/followers").to_return(status: 200, body: followers_json_response)

    following_json_response = File.open('fixtures/user_following.rb')
    stub_request(:get, "https://api.github.com/user/following").to_return(status: 200, body: following_json_response)

    following_json_response = File.open('fixtures/invite_mackenzie.rb')
    stub_request(:get, "https://api.github.com/users/#{invite_github_handle1}").to_return(status: 200, body: following_json_response)

    following_json_response = File.open('fixtures/invite_zach.rb')
    stub_request(:get, "https://api.github.com/users/#{invite_github_handle2}").to_return(status: 200, body: following_json_response)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(april)

    visit dashboard_path

    click_on 'Send an Invite'

    expect(current_path).to eq(new_invite_path)

    fill_in 'invite_github_handle', with: invite_github_handle1
    click_on 'Send Invite'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content('Successfully sent invite!')

    click_on 'Send an Invite'

    fill_in 'invite_github_handle', with: invite_github_handle2
    click_on 'Send Invite'
    expect(page).to have_content("The Github user you selected doesn't have an email address associated with their account.")

    expect(current_path).to eq(dashboard_path)
  end
end
