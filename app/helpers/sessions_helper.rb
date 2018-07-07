module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
    session[:last_login_time] = Time.now
    session[:last_request_time] = session[:last_login_time]
  end

  def create_signin_link
    if current_user
      link_to 'Sign Out', logout_path, method: :delete
    else
      link_to 'Sign In', login_path
    end
  end

end
