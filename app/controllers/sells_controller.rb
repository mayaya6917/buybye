class SellsController < ApplicationController
  before_action :set_sell, only: [:edit, :update, :destroy]

  def index
    @sells = current_user.sells
  end

  def new
    @sell = current_user.sells.new
  end

  def create
    @sell = current_user.sells.new(sell_params)

    if @sell.save
      redirect_to "/"
    else
      puts "Failed to save:"
      puts @sell.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @sell
      @sell.destroy
      redirect_to "/"
    else
      flash[:alert] = "対象の投稿が見つかりませんでした"
      redirect_to sells_path
    end
  end

  def show
    @sell = current_user.sells.find_by(id: params[:id])
  end

  def edit
    @sell = current_user.sells.find_by(id: params[:id])
  end

  def update
    if @sell.update(sell_params)
      redirect_to root_path
    else
      flash[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  private

  def sell_params
    params.require(:sell).permit(:item, :memo, :status_id, :price, :wish, :limit, :image)
  end

  def set_sell
    @sell = current_user.sells.find_by(id: params[:id])
    unless @sell
      flash[:alert] = "対象の投稿が見つかりませんでした"
      redirect_to sells_path
    end
  end

end
