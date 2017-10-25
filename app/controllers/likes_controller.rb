class LikesController < ApplicationController
  def create
    like = Like.find_or_create_by(user_id: like_params[:user_id], comment_id: like_params[:comment_id])
    like.active = like_params[:active]
    like.save
    redirect_to event_path(params[:event_id])
  end

  private

  def like_params
    params.require(:like).permit(:active, :user_id, :comment_id)
  end
end
