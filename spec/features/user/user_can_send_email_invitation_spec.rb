require 'rails_helper'

describe 'As a registered user visiting the dashboard' do
  it 'I can send an email invite' do
    april = create(:user, email: "test@email.com", password: "test", github_token: ENV['GITHUB_API_KEY'], github_uid: "41272635", github_handle: 'aprildagonese', github_url: 'https://github.com/aprildagonese')

    repos_json_response = File.open('fixtures/user_repos.rb')
    stub_request(:get, "https://api.github.com/user/repos").to_return(status: 200, body: repos_json_response)

    followers_json_response = File.open('fixtures/user_followers.rb')
    stub_request(:get, "https://api.github.com/user/followers").to_return(status: 200, body: followers_json_response)

    following_json_response = File.open('fixtures/user_following.rb')
    stub_request(:get, "https://api.github.com/user/following").to_return(status: 200, body: following_json_response)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(april)

    visit dashboard_path

    click_on 'Send an Invite'

    expect(current_path).to eq(invite_path)

    fill_in 'invite[github_handle]', with: 'valid github handle'
    click_on 'Send Invite'

    expect(current_path).to eq(dashboard_path)
    expect(flash[:notice]).to eq('Successfully sent invite!')

    click_on 'Send an Invite'

    fill_in 'user[github_handle]', with: 'invalid github handle'
    click_on 'Send Invite'

    expect(flash[:notice]).to eq("The Github user you selected doesn't have an email address associated with their account.")
    expect(current_path).to eq(dashboard_path)
  end
end

# When I visit /dashboard
# And I click "Send an Invite"
# Then I should be on /invite
#
# And when I fill in "Github Handle" with <A VALID GITHUB HANDLE>
# And I click on "Send Invite"
# Then I should be on /dashboard
# And I should see a message that says "Successfully sent invite!" (if the user has an email address associated with their github account)
# Or I should see a message that says "The Github user you selected doesn't have an email address associated with their account."
