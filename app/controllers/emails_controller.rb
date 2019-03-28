class EmailsController < ApplicationController
  def new
  end

  def create
    invite_data = GithubService.new(current_user.github_token)
                          .get_email(params['invite_github_handle'])
    if invite_data[:email] == nil
      flash[:invite_failure] = "The Github user you selected doesn't have an email address associated with their account."
    else
      invite = Invite.new(current_user, invite_data)
      UserMailer.invite_email(invite).deliver_now
      flash[:invite_success] = 'Successfully sent invite!'
    end
    redirect_to dashboard_path
  end

  def update
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:success] = "Thank you for registering! Your account is now active."
      redirect_to dashboard_path
    else
      flash[:error] = "Sorry, this user does not exist. Please try again or contact an administrator."
      redirect_to root_url
    end
  end
end
