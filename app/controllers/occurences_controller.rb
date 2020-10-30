class OccurencesController < ApplicationController
  def show
    @occurence = Occurence.find(params[:id])
  end

  def new
    @course = Course.find(params[:course_id])
    @occurence = Occurence.new
  end

  def create
    @occurence = Occurence.new(occurence_params)
    @course = Course.find(params[:course_id])
    @occurence.course = @course
    # @occurence.user = current_user
    @occurence.save
    # redirect_to course_occurence_path(@course) // not working
    redirect_to dashboard_path
  end

  def destroy
    @occurence = Occurence.find(params[:id])
    @course = Course.find(params[:course_id])
    @occurence.destroy
    redirect_to dashboard_path
  end

  private

  def occurence_params
    params.require(:occurence).permit(:date, :capacity, :location)
  end
end
