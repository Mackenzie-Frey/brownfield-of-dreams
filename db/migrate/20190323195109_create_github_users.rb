class CreateGithubUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :github_users do |t|
      t.references :users, foreign_key: true
      t.string :github_id

      t.timestamps
    end
  end
end
