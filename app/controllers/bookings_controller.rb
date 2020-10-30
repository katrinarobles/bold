class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @course = Course.find(params[:course_id])
    @occurences_all = Occurence.all
    @occurences = Occurence.where(course: @course)
  end

  def create
    @booking = Booking.new(booking_params)
    @course = Course.find(params[:course_id])
    # @booking.course = @course
    @booking.user = current_user
    if @booking.occurence.date.to_datetime.past? || @booking.occurence.bookings.count > @booking.occurence.capacity
      render :new
    else
      @booking.save
      redirect_to dashboard_path
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:occurence_id)
  end
end
