class User < ApplicationRecord
  has_many :user_videos
  has_many :videos, through: :user_videos
  has_many :friendships

  validates :email, uniqueness: true, presence: true
  validates_presence_of :first_name
  enum role: [:default, :admin]
  has_secure_password

  def connect_github(data)
    self.update!(github_token: data['credentials']['token'], github_uid: data['uid'])
    self.update!(github_uid: data['uid'])
  end
end
