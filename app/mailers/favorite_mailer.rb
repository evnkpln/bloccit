class FavoriteMailer < ApplicationMailer
    default from: 'evnkpln@gmail.com'
    
    def new_comment(user, post, comment)
        headers["Message-ID"] = "<comments/#{comment.id}@bloccit.example>"
        headers["In-Reply-TO"] = "<post/#{post.id}@bloccit.example>"
        headers["References"] = "<post/#{post.id}@bloccit.example>"
        
        @user = user
        @post = post
        @comment = comment
        
        mail(to: user.email, subject: "New comment on #{post.title}")
    end
    
    def new_post(user, post)
        headers["Message-ID"] = "<post/#{post.id}@bloccit.example>"
        headers["In-Reply-TO"] = "<post/#{post.id}@bloccit.example>"
        headers["References"] = "<post/#{post.id}@bloccit.example>"
        
        @user = user
        @post = post
        
        mail(to: user.email, subject: "You are subscribed to your new post: #{post.title}")
    end
end
