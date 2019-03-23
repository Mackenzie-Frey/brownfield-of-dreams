class GithubUser < ApplicationRecord
  belongs_to :user
  has_many :friendships, through: :user
  validates_presence_of :github_id
end
