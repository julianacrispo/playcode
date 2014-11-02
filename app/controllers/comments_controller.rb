class CommentsController < ApplicationController
  def show
    @product = products.find(params[:product_id])
    @comment = @product.comments
    @comment = Comment.new
  end

  def create
    @product = Product.find(params[:product_id])

    @comment = @product.comments.build( comment_params )
    @comment.product = @product

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
    params.require(:comment).permit(:body)
  end

end



