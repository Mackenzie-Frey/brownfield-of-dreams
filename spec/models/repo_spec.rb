require 'rails_helper'

RSpec.describe Repo, type: :model do

  describe 'attributes' do
    it 'has attributes' do
      hash = {id: 1234, name: "avery", html_url: "http://"}
      repo = Repo.new(hash)

      expect(repo.name).to eq("avery")
      expect(repo.html_url).to eq("http://")
    end
  end
end
