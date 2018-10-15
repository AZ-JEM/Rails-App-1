class CommentUpdateJob < ApplicationJob

  queue_as :default

  # Exercise 6.14c
  # def perform(*args)
  def perform(comment, current_user)
    # Do something later
    ProductChannel.broadcast_to(comment.product.id, comment: render_comment(comment, current_user), average_rating: comment.product.average_rating)
  end

  private

    def render_comment(comment, current_user)
      CommentsController.render(partial: 'comments/comment', locals: { comment: comment, current_user: current_user })
    end

end
