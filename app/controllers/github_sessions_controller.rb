class GithubSessionsController < ApplicationController
  def create
    current_user.connect_github(request.env["omniauth.auth"])
    redirect_to dashboard_path
  end
end
