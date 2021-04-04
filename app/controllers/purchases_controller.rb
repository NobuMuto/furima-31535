class PurchasesController < ApplicationController

  def index 
    @item = Item.find(params[:item_id])
    @purchase_post = PurchasePost.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_post = PurchasePost.new(purchase_post_params)   #「UserDonation」に編集
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
    params.require(:purchase_post).permit(:user_id, :item_id, :postal_code, :delivery_area_id, :city, :number, :building, :tel_number, :purchase_id).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]    
    Payjp::Charge.create(
      amount: @item.price,  
      card: purchase_post_params[:token],    
      currency: 'jpy'                 
    )
  end
end
