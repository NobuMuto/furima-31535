class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  #before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  #def move_to_index
  #  unless user_signed_in?
  #    redirect_to action: :index
  #  end
  #end

  private

  def item_params
    params.require(:item).permit(:name, :detail, :image, :category_id, :status_id, :delivery_fee_id, :delivery_area_id,
                                 :delivery_date_id, :price).merge(user_id: current_user.id)
  end
end
