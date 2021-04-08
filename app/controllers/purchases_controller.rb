class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index

  def index
    @purchase_post = PurchasePost.new
  end

  def create
    @purchase_post = PurchasePost.new(purchase_post_params)   # 「UserDonation」に編集
    if @purchase_post.valid?
      pay_item
      @purchase_post.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_post_params
    params.require(:purchase_post).permit(:postal_code, :delivery_area_id, :city, :number, :building, :tel_number).merge(
      token: params[:token], item_id: params[:item_id], user_id: current_user.id
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_post_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    redirect_to root_path unless current_user.id != @item.user_id
  end
end
