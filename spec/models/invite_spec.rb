require 'rails_helper'

context 'Relationships' do
  xit {should belong_to :user}
end

context 'Validations' do
  xit {should validate_presence_of :invite_github_handle}
end
