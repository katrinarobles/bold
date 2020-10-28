class UsersController < ApplicationController
  before_action :find_user, only: [:show]
  def show
    @courses = @user.courses
  end

  def dashboard
    @courses = current_user.courses
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
