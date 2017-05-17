require 'random_data'

50.times do
    Post.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
        )
end

50.times do
    r = rand(0..1)
    seedBool = r == 0
    Question.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph,
        resolved: seedBool
        )
end

posts = Post.all

100.times do
    Comment.create!(
        post: posts.sample,
        body: RandomData.random_paragraph
        )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Question.count} questions created"
puts "#{Comment.count} comments created"