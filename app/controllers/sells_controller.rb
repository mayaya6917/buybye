class SellsController < ApplicationController
  def index
    @sells = Sell.all
  end

  def new
    @sell = Sell.new
  end

  def create
    if current_user
      @sell = current_user.sells.new(sell_params)
  
      if @sell.save
        redirect_to "/"
      else
        puts "Failed to save:"
        puts @sell.errors.full_messages
        render :new, status: :unprocessable_entity
      end
    else
      flash[:alert] = "ログインしてください"
      redirect_to user_session_path
    end
  end

  private
  def sell_params
    params.require(:sell).permit(:item, :memo, :status_id, :price, :wish, :limit, :image).merge(user_id: current_user.id)
  end

end
