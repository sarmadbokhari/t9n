class AdminController < ApplicationController
  def index
  end

  def log_in
  	logged_in = The99Names::LogIn.run(username: params[:username], password: params[:password])
  	if logged_in.success?
  		redirect_to "/names"
  		session[:admin_id] = logged_in.admin_id
  	else
  		flash[:message] = logged_in.error
  		redirect_to "/admin"
  	end
  end
end
