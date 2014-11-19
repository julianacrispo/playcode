class CommentsController < ApplicationController
  def show
    @product = products.find(params[:product_id])
    @vendor = vendors.find(params[:vendor_id])
    @comment = @product.comments
    @comment = @vendor.comments #not sure about this line
    @comment = current_user.comments.build( comment_params )
  
    @comment = Comment.new
  end

  def create

    @product = Product.find(params[:product_id])

    #@vendor = Vendor.find(params[:vendor_id]) #todo: figure out the nested routes issue

    @comment = @product.comments.build( comment_params )
    #@comment = @current_user.comments.build( comment_params )
    @comment.product = @product
    @new_comment = Comment.new

    if @comment.save
      flash[:notice] = "Comment was saved"
    else
      flash[:error] = "There was an error saving. Please try again"
    end

    redirect_to @product
  end


  def destroy
    #grab item from the list
    @product = Product.find(params[:product_id])
    @comment = @product.comments.find(params[:id])
    #delete that item
      if @comment.destroy
        flash[:notice] = "comment was removed"
      else
        flash[:error] = "comment couldn't be removed. try again"
      end
    # respond_with(@item) do |f|
      redirect_to @product
    end


  private

  def comment_params
    params.require(:comment).permit(:body, :product_id, :vendor_id)
  end

end



