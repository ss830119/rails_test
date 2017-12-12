class AdminController < Backends::ResourcesController

  def edit
  end

  private

  def current_object
    # 用 default_scope 限制搜尋的範圍
    @current_object ||= current_admin
  end

  def permitted_attributes
    [
      :name,
      :email,
      :password,
      :password_confirmation
    ]
  end  


end
