class Invite < ApplicationRecord
  before_create :generate_token
  belongs_to :user, foreign_key: "user_id"
  validates_presence_of :invite_github_handle

end
