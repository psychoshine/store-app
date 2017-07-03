class ContactsController < ApplicationController
  before_action :check_contacts_presents, only: [:new, :create, :index]
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy, :show]

  def index
    if @no_contacts == true
      redirect_to new_contact_path
    else
      @contact = Contact.last
      @contact_u = ContactU.new
    end
  end


  def show
    @contact = Contact.last
    @contact_u = ContactU.new
  end


  def new
    @contact = Contact.new if @no_contacts == true
  end


  def edit
    @contact = Contact.last
  end

  def create
    if @no_contacts = true
      @contact = Contact.new(contact_params)
      respond_to do |format|
        if @contact.save
          format.html { redirect_to contacts_path, notice: 'Contact was successfully created.' }
     
        else
          format.html { render :new }
          
        end
      end
    end
  end


  def update
    @contact = Contact.last
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to contacts_path, notice: 'Contact was successfully updated.' }

      else
        format.html { render :edit }
        
      end
    end
  end

  def destroy
    @contact = Contact.last
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to new_contact_path, notice: 'Contact was successfully destroyed.' }
      
    end
  end


  private

    def set_contact
      @contact = Contact.find(params[:id])
    end
    def check_contacts_presents
      @no_contacts = true if Contact.all.count < 1
    end
    def admin_user
      redirect_to(root_url) unless current_user.present? and current_user.admin?
    end

    def contact_params
      params.require(:contact).permit(:fb, :insta, :vk, :phone, :phone2, :phone3, :description2, :description, :adress, :adress2, :twitter, :email, :how_to_get, :how_to_get2)
    end
end
