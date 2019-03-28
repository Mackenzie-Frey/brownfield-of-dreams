# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_OAUTH_CLIENT_ID'], ENV['GITHUB_OAUTH_CLIENT_SECRET'], scope: 'repo'
end
