class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
    redirect_to event_path(params[:comment][:event_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :event_id)
  end
end
