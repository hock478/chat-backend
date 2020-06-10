class User < ApplicationRecord
    has_secure_password
    has_many :follows, dependent: :destroy
    has_many :messages, dependent: :destroy

    has_many :group_users, dependent: :destroy

    has_many :groups , through: :group_users
    has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
    has_many :followers, through: :follower_relationships, source: :follower
    has_many :following_relationships, foreign_key: :user_id, class_name: 'Follow'
    has_many :following, through: :following_relationships, source: :following


    # has_many :groupUsers

# has_many :messages

# Has_many groups through groupusers

# Has_many :follows

# has_many :follower_relationships, foreign key: following_id, classname: Follow

# has_many :followers through follower_relationships, source: :follower

# has_many :following_relationships, foreign key: user_id, classname: Follow

# has_many :following, :through follower_relationships, source: following
end
