class ReservationsController < ApplicationController
  def index
    @user = current_user
    @rooms = Room.all
    @reservations = Reservation.all
  end

  def new
    @user = current_user
    @reservation = Reservation.new(reservation_params)
    @room = Room.all
  end

  def create
  @user = current_user
  @room = Room.all
  @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice_green] = "スケジュール予約を登録しました"
      redirect_to reservations_path
    else
      flash.now[:notice_red] = "予約を登録できませんでした"
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def reservation_params
      params.require(:reservation).permit(:people, :start_date, :end_date, :room_id, :user_id)
    end
end
