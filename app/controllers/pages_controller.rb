class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @courses = Course.all
    @markers = @courses.geocoded.map do |course|
      {
        lat: course.latitude,
        lng: course.longitude
      }
    end
  end
end
