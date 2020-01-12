class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :github_uid
      t.string :name
      t.string :nickname
      t.string :avatar_url
      t.text :bio

      t.timestamps
    end
  end
end
