require 'rails_helper'

describe 'GitHub Service' do
  it 'exists' do
    service = GithubService.new

    expect(service).to be_a(GithubService)
  end

  it 'gets repos', :vcr do
    service = GithubService.new

    result = service.get_repos
    expect(result).to be_a(Hash)
    expect(result)[0].to have_key(:html_url)
  end
end
