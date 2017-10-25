module LikesHelper
  def check_if_clicked(comment_obj, user_id, status)
    if comment_obj.likes.empty?
      return nil
    else
      like = comment_obj.likes.select {|like| like.user_id == user_id}
      return 'orange' if like[0].active == status
    end
  end
end
