# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creating admin..."
user = User.create(email: "user@email.com", password: "password", password_confirmation: "password", role: "admin")
puts "Admin Created!"
puts "Creating links..."
Link.create(base_url: "https://www.google.com", short_url: SecureRandom.hex(3), clicks: 100000, creator_id: user.id)
Link.create(base_url: "https://www.youtube.com", short_url: SecureRandom.hex(3), clicks: 995000, creator_id: user.id)
Link.create(base_url: "https://www.facebook.com", short_url: SecureRandom.hex(3), clicks: 920000, creator_id: user.id)
Link.create(base_url: "https://www.baidu.com", short_url: SecureRandom.hex(3), clicks: 870010, creator_id: user.id)
Link.create(base_url: "https://www.wikipedia.org", short_url: SecureRandom.hex(3), clicks: 870000, creator_id: user.id)
Link.create(base_url: "https://www.yahoo.com", short_url: SecureRandom.hex(3), clicks: 854600, creator_id: user.id)
Link.create(base_url: "https://www.google.co.in", short_url: SecureRandom.hex(3), clicks: 843870, creator_id: user.id)
Link.create(base_url: "https://www.amazon.com", short_url: SecureRandom.hex(3), clicks: 826770, creator_id: user.id)
Link.create(base_url: "https://www.twitter.com", short_url: SecureRandom.hex(3), clicks: 822220, creator_id: user.id)
Link.create(base_url: "https://www.live.com", short_url: SecureRandom.hex(3), clicks: 812230, creator_id: user.id)
Link.create(base_url: "https://www.instagram.com", short_url: SecureRandom.hex(3), clicks: 812980, creator_id: user.id)
puts "Done creaing links!"
puts "Seed Complete!"