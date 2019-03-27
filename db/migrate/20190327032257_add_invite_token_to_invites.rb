class AddInviteTokenToInvites < ActiveRecord::Migration[5.2]
  def change
    add_column :invites, :invite_token, :string
  end
end
