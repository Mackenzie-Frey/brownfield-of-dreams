class UserMailerPreview < ActionMailer::Preview
  def invite_email
    current_user = User.find(3)
    invite_data = { :name=>"Mackenzie Frey",  :email => 'test@brownfield.com' }

    invite = Invite.new(current_user, invite_data)
    UserMailer.invite_email(invite).deliver_now
  end
end
