class OccurencesController < ApplicationController
  def new
    @occurence = Occurence.new
  end

  def create
    @occurrence = Occurence.new(occurrence_params)
    @occurrence.course = Course.find(params[:id])
    @occurrence.save
    redirect_to dashboard_path
  end

  private

  def occurrence_params
    params.require(:occurrence).permit(:date, :time)
  end
end
