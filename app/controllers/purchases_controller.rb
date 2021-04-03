class PurchasesController < ApplicationController

  def index 
  end

  def create
    @purchase_post = PurchasePost.new(purchase_params)   #「UserDonation」に編集
     if @upurchase_post.valid?
       @purchase_post.save
       redirect_to action: :index
     else
       render action: :new
     end
  end
  
  private

  def purchase_params
    params.require(:purchase_post).permit(:user_id, :item_id, :postal_code, :delivery_area_id, :city, :number, :building, :tel_number, :purchase_id, :token)
  end

end
