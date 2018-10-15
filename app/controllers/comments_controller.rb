class CommentsController < ApplicationController

  # ---------------------------------------------------------------------- /
  # Exercise 5.8
  # ---------------------------------------------------------------------- /
  def create

    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    # Exercise 6.14c
    @user = current_user

    respond_to do |format|
        if @comment.save
          # Exercise 6.13 : ActionCable
          # ActionCable.server.broadcast 'product_channel', comment: @comment, average_rating: @comment.product.average_rating
          # Exercise 6.14 (a)
          # ProductChannel.broadcast_to @product.id, comment: @comment, average_rating: @comment.product.average_rating
          # Exercise 6.14 (b)
          # ProductChannel.broadcast_to @product.id, comment: CommentsController.render(partial: 'comments/comment', locals: {comment: @comment, current_user: current_user}), average_rating: @product.average_rating
          # Exercise 6.14 (b) : Move this to ActiveJob...

          format.html { redirect_to @product, notice: 'Review was created successfully.' }
          format.json { render :show, status: :created, location: @product }
          # Exercise 6.10 : AJAX
          format.js
          # product scoped comment counters...
          # make key available to JS...
          @comment_key = "#{@product.id}_comment_count"
          $redis.incr @comment_key
        else
          format.html { redirect_to @product, alert: 'Review was not saved successfully.' }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end

  end

  def destroy
    @comment = Comment.find(params[:id])
    product = @comment.product
    @comment.destroy
    redirect_to product
  end

  private

    def comment_params
      params.require(:comment).permit(:user_id, :body, :rating)
    end

end
