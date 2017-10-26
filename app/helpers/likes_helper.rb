module LikesHelper
  def check_if_clicked(comment_obj, user_id)
    if comment_obj.likes.empty?
      return nil
    else
      like = comment_obj.likes.select {|like| like.user_id == user_id}
      return 'orange' if like[0].active == true
    end
  end

  def count_likes(like_objs)
    like_objs.where("active = ?", true).count
  end
end
