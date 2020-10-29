class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @courses = Course.all
    if params[:query].present?
   #    sql_query = " \
   #      courses.name ILIKE :query \
   #      OR courses.location ILIKE :query \
   #      OR user.name ILIKE :query \
   #  "
    #  @courses = Course.joins(:user).where(sql_query, query: "%#{params[:query]}%").limit(10)
      @courses = Course.search_by_name_and_location(params[:query]).limit(10)
    else
     @courses = Course.all.limit(10)
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
