class CartConfirmsController < ApplicationController

  def new
    @shopping_cart = ShoppingCart.find(params[:shopping_cart_id])
    @cart_confirm = @shopping_cart.cart_confirms.build unless @shopping_cart.cart_confirms.any?
  end

  def create
    @shopping_cart = ShoppingCart.find(params[:shopping_cart_id])
    @cart_confirm =  @shopping_cart.cart_confirms.build(cart_confirm_params) unless @shopping_cart.cart_confirms.any?

    respond_to do |format|
      if @cart_confirm.save
        format.html { redirect_to @shopping_cart, notice: 'Shopping cart was confirmed.' }
      else
        format.html { redirect_to :back, notice: 'Shopping cart was not confirmed.' }
      end
    end
  end

  def destroy
    @cart_confirm = CartConfirm.find(params[:id])
    @cart_confirm.destroy
      respond_to do |format|
        format.html { redirect_to :back, notice: 'Cart confirmation was successfully destroyed.' }
      
      end
  end

  private

    def cart_confirm_params
      params.require(:cart_confirm).permit(:shopping_cart_id)
    end
end
