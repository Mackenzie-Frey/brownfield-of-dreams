class EmailsController < ApplicationController
  def new
    # Test they are not a registered user already
    # Convert the handle to a url via an api call to GitHub,
    # if email exists save the invite, make an invite_token, then send the email
    #if no email exists, show flash message
    
    binding.pry
    @invite = Invite.new
    @invite.user_id = current_user.id
    if @invite.save &&

    else
      #insert flash message logic
    end
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
