class FollowMailer < ActionMailer::Base
  default from: "julianacrispo@gmail.com"

     def new_comment(user, product, comment) #method called in order to send an email to someone about their followed prods
 
     # New Headers
     headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
     headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
     headers["References"] = "<post/#{post.id}@your-app-name.example>"
 
     @user = user
     @product = product
     @comment = comment
 
     mail(to: user.email, subject: "New comment on #{product.name}")
   end

end
