class CoursesController < ApplicationController
  before_action :find_course, only: [ :show, :edit, :update, :destroy ]
  def index
    @courses = current_user.courses
  end

  def show
  end

  def new
    @course = Course.new
  end
  def create
    @course = Course.new(course_params)
    @course.user = current_user
    @course.save
    redirect_to dashboard_path
  end

  def edit
  end

  def update
    @course.update(course_params)
    redirect_to dashboard_path
  end

  def destroy
    @course.destroy
    redirect_to dashboard_path
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :duration, :price, :location, :capacity)
  end

  def find_course
    @course = Course.find(params[:id])
  end
end
