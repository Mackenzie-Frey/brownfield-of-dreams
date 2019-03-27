class EmailsController < ApplicationController
  def new
    @invite = Invite.new
  end

  def create
    GithubService.new(current_user.github_token).get_email(params['invite']['invite_github_handle'])
    # Convert the handle to a url via an api call to GitHub,
    # if email exists save the invite, make an invite_token, then send the email
    #if no email exists, show flash message
binding.pry
    # GithubService.new(params)
    # @invite = Invite.new()
    # @invite.user_id = current_user.id
    # if @invite.save &&
    #
    # else
    #   #insert flash message logic
    # end
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
