class CommentsController < ApplicationController
before_filter :find_commentable #find the thing that they're commenting on

  def create
    @comment = @commentable.comments.build( comment_params )
    @comment.user_id = current_user.id if current_user
      if @comment.save
        flash[:notice] = "comment was saved"
      else
         flash[:error] = "comment couldn't be saved. try again"
       end

    redirect_to @commentable
  end

#todo: fix comment destroy and
  def destroy
    unless @commentable.user == current_user
      return redirect_to @commentable, notice: "Not authorized"
    end
    #grab item from the list
    #todo: add authorization so only the user of the comments can delete it. 
    @comment = Comment.find( params[:id] )
    #@comment = @commentable.comments.find( comment_params )
    #delete that item
    
      if @comment.destroy
        flash[:notice] = "comment was removed"
      else
        flash[:error] = "comment couldn't be removed. try again"
      end
    # respond_with(@item) do |f|
      redirect_to @commentable
    end


  private

  def find_commentable
    if params[:vendor_id]
      @commentable = Vendor.find params[:vendor_id]
    elsif params[:product_id]
      @commentable = Product.find params[:product_id]
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end



