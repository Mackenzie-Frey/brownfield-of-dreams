class Invite

  def initialize(current_user, invite_data)
    @name = invite_data[:name]
    @email = invite_data[:email]
    @inviter_name = current_user[:first_name] + " " + current_user[:last_name]
  end
end
