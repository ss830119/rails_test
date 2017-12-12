class BackendsController < ApplicationController

  before_action :login?

  def index

  end

  private

  def login?
    unless current_admin
      reset_session
      redirect_to new_admin_session_path
    end
  end

end
