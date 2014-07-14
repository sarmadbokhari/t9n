class ApplicationController < ActionController::Base

  helper_method :admin?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def admin?
      admin = The99Names.db.get_admin(session[:admin_id])

      admin ? true : false
  end
end
