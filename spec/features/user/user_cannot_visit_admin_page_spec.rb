require 'rails_helper'

describe 'user visits admin page' do
  it 'user cannot visit an admin only page' do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_dashboard_path

    expect(page).to have_content(404)
  end
end
