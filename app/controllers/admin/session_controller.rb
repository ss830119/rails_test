class Admin::SessionController < ApplicationController

  def new
    if current_admin
      redirect_to backends_path
    else
      render layout: false
    end
  end

  def create
    @admin = Admin.find_by(email: params[:email]).try(:authenticate, params[:password])
    
    if @admin
      session[:admin] = @admin.id
      flash[:success] = "登入成功."

      @url = session[:origin_url] || backends_path.referer
      session[:origin_url] = nil

      redirect_to @url
    else
      flash[:error] = "登入失敗."

      redirect_to new_admin_session_path
    end
  end

  def destroy
    reset_session
    redirect_to new_admin_session_path
  end


end
