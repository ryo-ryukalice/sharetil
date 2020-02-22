class User < ApplicationRecord
  has_many :followee_follows, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followees, through: :followee_follows, source: :followee

  has_many :follower_follows, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: :follower_follows, source: :follower

  def follow(other_user)
    followees << other_user
  end

  def unfollow(other_user)
    followee_follows.find_by(followee_id: other_user.id).destroy!
  end

  def following?(other)
    followees.include?(other)
  end
end
