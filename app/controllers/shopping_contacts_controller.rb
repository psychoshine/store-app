class ShoppingContactsController < ApplicationController
  before_action :set_shopping_contact, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:index]

  def index
    @shopping_contacts = ShoppingContact.all
  end

  def show
  end


  def new
    @shopping_cart = ShoppingCart.find(params[:shopping_cart_id])
    @shopping_contact = @shopping_cart.shopping_contacts.build unless @current_contact.present?
  end


  def edit
  end


  def create
    
    @shopping_cart = ShoppingCart.find(params[:shopping_cart_id])
    @shopping_contact = @shopping_cart.shopping_contacts.build(shopping_contact_params)
    if @shopping_cart.user_id.present?
      @shopping_contact.user_id = @shopping_cart.user_id
    end


    respond_to do |format|
      if @shopping_contact.save
        format.html { redirect_to @shopping_cart, notice: 'Shopping contact was successfully created.' }
        
      else
        format.html { redirect_to @shopping_cart, notice: 'All fields must be completed.' }
        
      end
    end
  end

  def update
    respond_to do |format|
      if @shopping_contact.update(shopping_contact_params)
        if @shopping_contact.shopping_cart.present?
          format.html { redirect_to @shopping_contact.shopping_cart, notice: 'Shopping contact was successfully updated.' }
          
        else
          format.html { redirect_to @shopping_contact, notice: 'Shopping contact was successfully updated.' }
          
        end
      else
        format.html { render :edit }
        
      end
    end
  end

  def destroy
    @shopping_contact.destroy
    respond_to do |format|
      format.html { redirect_to shopping_contacts_url, notice: 'Shopping contact was successfully destroyed.' }
      
    end
  end

  private

    def set_shopping_contact
      @shopping_contact = ShoppingContact.find(params[:id])
    end
    def admin_user
      redirect_to(shop_items_path) unless current_user.present? and current_user.admin?
    end

    def shopping_contact_params
      params.require(:shopping_contact).permit(:shopping_cart_id, :user_id, :state, :city, :zip_code, :adress, :email, :phone, :full_name)
    end
end
