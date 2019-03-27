require 'rails_helper'

describe 'Invite', type: :model do
  context 'Relationships' do
    xit { should belong_to :user }
  end

  context 'Validations' do
    xit { should validate_presence_of :invite_github_handle }
  end
end
