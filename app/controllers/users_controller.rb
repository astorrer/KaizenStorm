class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_user, only: [ :assign_reviewer_role, :demote_from_reviewer_role, :assign_admin_role,
                                   :demote_from_admin_role, :activate_account, :deactivate_account, :destroy ]

  def assign_reviewer_role
    @user = User.find(params[:id])
    @user.add_role :reviewer
    redirect_to users_path
  end

  def demote_from_reviewer_role
    @user.remove_role :reviewer
    redirect_to users_path
  end

  def assign_admin_role
    @user.add_role :admin
    redirect_to users_path
  end

  def demote_from_admin_role
    @user.remove_role :admin
    redirect_to users_path
  end

  def activate_account
    @user.update(:active_account => true)
    redirect_to users_path
  end

  def deactivate_account
    @user.update(:active_account => false)
    redirect_to users_path
  end
  
  def destroy
    @user.destroy
    redirect_to users_path
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end