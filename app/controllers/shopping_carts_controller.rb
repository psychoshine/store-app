class ShoppingCartsController < ApplicationController
  before_action :set_shopping_cart, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:edit, :update, :index]

  def index
    @shopping_carts = ShoppingCart.all.paginate(:page => params[:page], :per_page => 20)
  end

  def show
    @cart_items = @shopping_cart.cart_items.paginate(:page => params[:page], :per_page => 20)
    @current_contact = @shopping_cart.shopping_contacts.last
    @shopping_contact = @shopping_cart.shopping_contacts.build if @cart_items.any? and !@current_contact.present?
    @cart_items_price = @cart_items.inject(0) {|sum, item| sum + (item.shop_price*item.quantity) }
    @confirmation = @shopping_cart.cart_confirms.last
    @cart_confirm = @shopping_cart.cart_confirms.build if @current_contact.present? and !@confirmation.present?
    
  end


  def new
    @shopping_cart = ShoppingCart.new
  end


  def edit
  end


  def create
    @shopping_cart = ShoppingCart.new(shopping_cart_params)
    respond_to do |format|
      if @shopping_cart.save
        format.html { redirect_to @shopping_cart, notice: 'Shopping cart was successfully created.' }
        
      else
        format.html { render :new }
        
      end
    end
  end


  def update
    respond_to do |format|
      if @shopping_cart.update(shopping_cart_params)
        format.html { redirect_to @shopping_cart, notice: 'Shopping cart was successfully updated.' }
        
      else
        format.html { redirect_to @shopping_cart, notice: 'Shopping cart was not updated.' }
        
      end
    end
  end

  def destroy
    @shopping_cart.destroy unless @shopping_cart.cart_confirms.last.present?
    respond_to do |format|
      session.delete(:shopping_cart_id)

      format.html { redirect_to shopping_carts_url, notice: 'Shopping cart was successfully destroyed.' }
      
    end
  end

  private

    def set_shopping_cart
      @shopping_cart = ShoppingCart.find(params[:id])
    end

    def admin_user
      redirect_to(shop_items_path) unless current_user.present? and current_user.admin?
    end

    def shopping_cart_params
      params.require(:shopping_cart).permit(:user_id, :shop_item_ids, :selected_item_ids, :contact_info_id, :item_list, :session_id, :ready_status)
    end
end
