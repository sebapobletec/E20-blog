class PagesController < ApplicationController
  before_action :is_admin?
  def index
    @users = User.all
  end
  private
  def is_admin?
    if current_user.admin? == false
      redirect_to root_path
    end
  end

end
