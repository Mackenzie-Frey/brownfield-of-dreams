# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    if current_user.github_token?
      @facades = UserFacade.new(current_user)
    end
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:error] = 'Username already exists'
      render :new
    end
  end

  def github_auth
    current_user.update_attribute(:github_token, github_token)
    current_user.update_attribute(:github_id, github_id)

    redirect_to dashboard_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end

  def github_token
    request.env["omniauth.auth"]["credentials"]["token"]
  end

  def github_id
    request.env["omniauth.auth"]["uid"]
  end
end
