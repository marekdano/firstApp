class CommentsController < ApplicationController
  before_action :authenticate_user! # allows only signed in users 
  before_action :authenticate_admin! , only: :destroy # allows only admins to destroy

  def create
    @product = Product.friendly.find(params[:product_id])
    @comment = @product.comments.build(comment_params)
    @comment.user = current_user
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @product, notice: "Review was created successfully." }
        # use anchor getting to the specific page section
        # format.html { redirect_to product_path(@product, anchor: 'new-comment-box'), notice: "Review was created successfully." }
        format.json { render :show, status: :created, location: @product }
        format.js
      else
        format.html { redirect_to @product, alert: "Review was not saved successfully. Comment cannot be empty and rate must be chosen." }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
    #redirect_to product_path(@product)
  end

  def destroy
    @comment = Comment.find(params[:id])
    product = @comment.product
    @comment.destroy
    redirect_to product
  end
  
  private

  def authenticate_admin!
    current_user.admin? # either true or false 
  end

  def comment_params
    params.require(:comment).permit(:user_id, :body, :rating)
  end
  
end
