class BackendsController < ApplicationController

  before_action :login?

  def index

  end

  private

  def login?
    unless current_admin
      respond_to do |format|
        format.html {
          session[:origin_url] = request.original_url 
          redirect_to new_admin_session_path
        }
      end 
    end
  end

end
