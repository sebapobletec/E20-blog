class PagesController < ApplicationController

  def index
    @users = User.all
  end

  def delete
    @user = User.find(:params[:id])
    redirect_to 'pages_path'
  end

end
