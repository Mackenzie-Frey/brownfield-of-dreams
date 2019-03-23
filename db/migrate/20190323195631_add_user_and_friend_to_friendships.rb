class AddUserAndFriendToFriendships < ActiveRecord::Migration[5.2]
  def change
    add_reference :friendships, :user, index: true
    add_reference :friendships, :friend, index: true

    add_foreign_key :friendships, :users, column: :user_id
    add_foreign_key :friendships, :users, column: :friend_id
  end
end
