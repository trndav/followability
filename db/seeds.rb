User.destroy_all 
Post.destroy_all 
puts 'Creating main users'
adminbro = User.create(email: 'adminbro@email.com', 
                    password: "123456", 
                    password_confirmation: "123456")
trndav = User.create(email: 'trndav@email.com', 
                    password: "123456", 
                    password_confirmation: "123456")
bob = User.create(email: 'bob@email.com', 
                    password: "123456", 
                    password_confirmation: "123456")
# Blocking users
adminbro.block(trndav)
trndav.block(bob)
# Create 5 users with Faker
puts "Creatig other users with Faker gem"
5.times do 
    User.create(email: Faker::Internet.email,
                password: '123456',
                password_confirmation: '123456')
end
# Create 10 posts with Faker. 10 x 8 users = 80 posts.
puts 'Creating posts with Faker'
User.all.each do |user|
    10.times do
        user.posts.create(
            title: Faker::Lorem.sentence(word_count: 4),
            body: Faker::Lorem.paragraph(sentence_count: 3))
    end
end
# Random block users
puts "Random block users"
User.all.each do |user|
    user.block(User.all.sample)
end
