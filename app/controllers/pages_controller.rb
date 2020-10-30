class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @courses = Course.all
    @occurences = Occurence.all
    if params[:query].present?
      @courses = Course.search_by_name(params[:query])
    else
      @courses = Course.all
    end
    
    @markers = @occurences.geocoded.map do |occurence|

      {
        lat: occurence.latitude,
        lng: occurence.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { occurence: occurence })
      }
    end
  end

end
