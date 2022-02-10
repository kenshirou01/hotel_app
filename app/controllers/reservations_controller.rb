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

    if @reservation.start_date == nil || @reservation.end_date == nil || @reservation.people == nil
      redirect_to room_path(@reservation.room_id)
      flash[:notice] = "必須項目を入力してください"
    else
      if @reservation.start_date >= @reservation.end_date
        redirect_to room_path(@reservation.room_id)
        flash[:notice] = "終了日は開始日以降の日付を選択してください"
      elsif @reservation.people.to_i < 1
        redirect_to room_path(@reservation.room_id)
        flash[:notice] = "人数を入力してください"
      end
      @reservation.total_day = @reservation.days
      @reservation.total_amount = @reservation.amount
    end
  end

  def create
  @user = current_user
  @room = Room.all
  @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice_green] = "スケジュール予約を登録しました"
      redirect_to reservation_path(@reservation.id)
    else
      redirect_to room_path(@reservation.room_id)
    end
  end

  def show
    @user = current_user
    @reservation = Reservation.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def reservation_params
      params.require(:reservation).permit(:people, :start_date, :end_date, :total_day, :total_amount, :room_id, :user_id)
    end
end
