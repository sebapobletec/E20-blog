class UsersController < ApplicationController

  def destroy
@user = User.find(params[:id])
    @user.destroy!
    respond_to do |format|
      format.json { respond_to_destroy(:ajax) }
      format.xml  { head :ok }
      format.html { respond_to_destroy(:html) }
    end
  end

  def edit
    redirect_to root
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  if params[:user][:password].blank?
    params[:user].delete(:password)
    params[:user].delete(:password_confirmation)
  end

end
