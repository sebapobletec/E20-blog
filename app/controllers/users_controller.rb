class UsersController < ApplicationController
  load_and_authorize_resource
  def destroy
    @user.destroy!
    redirect_to pages_index_path
  end

  def update

    if @user.admin?
      @user.role = 1
    else
      @user.role = 0
    end
    @user.save!
    redirect_to pages_index_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
