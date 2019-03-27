class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
      t.references :user, foreign_key: true
      t.string :invite_github_handle

      t.timestamps
    end
  end
end
