class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @user = current_user
  end

  def new
    @user = current_user
    @room = Room.new
  end

  def create
    @user = current_user
    @room = Room.new(room_params)

    if @room.save
      flash[:notice_green] = "スケジュールを登録しました"
      redirect_to rooms_path
    else
      flash.now[:notice_red] = "登録できませんでした"
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
    def room_params
      params.require(:room).permit(:room_name, :room_introduction, :room_price, :room_address, :room_image, :user_id)
    end
end
