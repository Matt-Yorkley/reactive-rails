# frozen_string_literal: true

class UserReflex < ApplicationReflex
  def validate
    @user = User.where(id: params[:id]).first_or_initialize
    @user.assign_attributes(user_params)
    @user.valid?
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :subscription_id, :admin)
  end
end
