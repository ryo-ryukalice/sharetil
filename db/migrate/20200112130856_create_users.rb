class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :github_uid
      t.string :github_nickname
      t.string :github_avatar_url

      t.timestamps
    end
  end
end
