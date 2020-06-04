# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Group.destroy_all
GroupUser.destroy_all
Message.destroy_all
Follow.destroy_all

user1 = User.create(username: "dawit400", fullname: "Dawit Gizaw", age: 19, profile_pic: nil, bio: "Living life", password_digest: BCrypt::Password.create("password"))
user2 = User.create(username: "junior300", fullname: "Junior Dinho",age: 27, profile_pic: nil, bio: "Days goin by...", password_digest: BCrypt::Password.create("password"))

group1 = Group.create(title: "First Time Users", user_id: user1.id)
group2 = Group.create(title: "Upcoming Election??", user_id: user1.id)

groupuser1 = GroupUser.create(user_id: user1.id, group_id: group1.id)
groupuser2 = GroupUser.create(user_id: user2.id, group_id: group1.id)
groupuser3 = GroupUser.create(user_id: user2.id, group_id: group2.id)

message1 = Message.create(user_id: user1.id, content: "This app is cool", group_id: group1.id)
message2 = Message.create(user_id: user2.id, content: "This app is lame", group_id: group1.id)
message3 = Message.create(user_id: user2.id, content: "Just kidding its cool..", group_id: group2.id)

follow1 = Follow.create(user_id: user1.id, following_id: user2.id)
follow2 = Follow.create(user_id: user2.id, following_id: user1.id)





