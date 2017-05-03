require 'random_data'

50.times do
    Post.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
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
puts "#{Comment.count} comments created"

special_post = Post.find_or_create_by!(
    title: "This post",
    body: "is special."
    )
Comment.find_or_create_by!(
    post: special_post,
    body: "Real English!"
    )