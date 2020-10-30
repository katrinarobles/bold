class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @courses = Course.all
    if params[:query].present?
      @courses = Course.search_by_name_and_location(params[:query])
    else
      @courses = Course.all
    end

    @markers = @courses.geocoded.map do |course|
      {
        lat: course.latitude,
        lng: course.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { course: course })
      }
    end
  end

end
