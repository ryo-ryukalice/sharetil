class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.integer :followee_id, foreign_key: true, index: true
      t.integer :follower_id, foreign_key: true, index: true

      t.index %i[followee_id follower_id], unique: true

      t.timestamps
    end
  end
end
