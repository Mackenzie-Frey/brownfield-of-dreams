# frozen_string_literal: true

class CreateFriendshipsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.integer :user_id
      t.integer :friend_user_id
    end

    add_index(:friendships, %i[user_id friend_user_id], unique: true)
    add_index(:friendships, %i[friend_user_id user_id], unique: true)
  end
end
