class Invite < ApplicationRecord
  before_create :generate_token
  belongs_to :user, foreign_key: "user_id"
  validates_presence_of :invite_github_handle

  # def initialize(github_handle)
  #   @github_handle = github_handle
  # end

  # def generate_token
  #   self.invite_token = SecureRandom.urlsafe_base64.to_s
  # end
end
