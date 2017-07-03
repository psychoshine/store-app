class ShopItemsController < ApplicationController
  before_action :set_shop_item, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    if params[:search].present?
      @shop_items = ShopItem.search_for_items(params[:search]).paginate(:page => params[:page], :per_page => 32).order('created_at DESC')
    else
      @shop_items = ShopItem.all.paginate(:page => params[:page], :per_page => 32).order('created_at DESC')
    end
  end


  def show
    @cart_item = @shop_item.cart_items.build
    @cart_items = @shop_item.cart_items
  end


  def new
    @shop_item = ShopItem.new
  end


  def edit
  end


  def create
    @shop_item = ShopItem.new(shop_item_params)

    respond_to do |format|
      if @shop_item.save
        format.html { redirect_to shop_items_path, notice: 'Shop item was successfully created.' }
        
      else
        format.html { render :new }
        
      end
    end
  end


  def update
    respond_to do |format|
      if @shop_item.update(shop_item_params)
        format.html { redirect_to @shop_item, notice: 'Shop item was successfully updated.' }
        
      else
        format.html { render :edit }
        
      end
    end
  end


  def destroy
    @shop_item.shop_image = nil
    @shop_item.save
    @shop_item.destroy
    respond_to do |format|
      format.html { redirect_to shop_items_url, notice: 'Shop item was successfully destroyed.' }
   
    end
  end

  private

    def set_shop_item
      @shop_item = ShopItem.find(params[:id])
    end
    def admin_user
      redirect_to(shop_items_path) unless current_user.present? and current_user.admin?
    end


    def shop_item_params
      params.require(:shop_item).permit(:title1, :title2, :description1, :description2, :price, :shop_image, :search)
    end
end
