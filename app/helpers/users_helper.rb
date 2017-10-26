module UsersHelper
  def login_verification
    (session[:user_id] != nil ? user_path(session[:user_id]) : login_path)
  end
end
