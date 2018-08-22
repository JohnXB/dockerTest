class SessionsController < ApplicationController
  include SessionsHelper
  def new
  end

  def create
    name = params[:session][:name]
    password = params[:session][:password]
    #User.find_by_login(login)是新增加的一个类方法，用来实现name或者email的登录
    user = User.find_by_name(name)
    #authenticate是has_secure_password引入的一个方法，用来判断user的密码与页面中传过来的密码是否一致
    if user && user.authenticate(password)
      log_in(user) #SessionsHelper中的方法
      #判断是否要持续性的记住用户的登录状态
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      redirect_to user_path(user)
    else
      flash.now[:danger] = "用户名或密码错误."
      render 'new'
    end
  end

  def destroy
    log_out if logged_in? #SessionsHelper中的方法
    redirect_to user_path
  end

end
