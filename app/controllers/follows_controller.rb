class FollowsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    follow = current_user.follows.build(product: @product)

    if follow.save
      flash[:notice] = "followed"
      redirect_to [@product]
    else
      flash[:error] = "unable to follow. please try again"
      redirect_to [@product]
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    follow = current_user.follows.find(params[:id])

    #some authorization to determine that this follow belonged to current user 

    if follow.destroy
      flash[:notice] = "Unfollowed"
      redirect_to [@product]
    else
      flash[:error] = "Unable to follow"
      redirect_to @product
    end
  end


end
