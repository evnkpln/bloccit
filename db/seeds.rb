require 'random_data'

50.times do
    Post.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
        )
end
posts = Post.all

50.times do
    Advertisement.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph,
        price: rand(0...25000)
        )
end


100.times do
    Comment.create!(
        post: posts.sample,
        body: RandomData.random_paragraph
        )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"