module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
    session[:last_login_time] = Time.now
    session[:last_request_time] = session[:last_login_time]
  end

end
