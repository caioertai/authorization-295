if Rails.env.development?
  puts "Destroying db..."
  Restaurant.destroy_all
  User.destroy_all
end

puts "Create 🦊 user"
fox = User.create!(
  email: 'fox🦊@woods.com',
  password: 123456
)

Restaurant.create!(
  name: "Fox's Den",
  user: fox
)

puts "Create 🐑 user"
sheep = User.create!(
  email: 'sheep🐑@woods.com',
  password: 123456
)

Restaurant.create!(
  name: "Sheep's Field",
  user: sheep
)
