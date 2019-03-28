# frozen_string_literal: true

class UserMailer < ActionMailer::Base
  default from: 'no-reply@brownfield.com'

  def registration_email(user)
    @user = user
    mail(:to => "#{@user.first_name} <#{@user.email}>", :subject => "Brownfield Confirmation")
 end

 def invite_email(invite)
   @invite = invite
   mail(:to => "#{@invite.name} <#{@invite.email}>", :subject => "Brownfield Invitation")
 end
end
