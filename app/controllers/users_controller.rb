class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action :find_user, only: [ :show ]
  def show
    @courses = @user.courses
  end

  def dashboard
    @user = current_user
    @courses = @user.courses
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
