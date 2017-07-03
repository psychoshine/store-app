class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    include SessionsHelper
    include UrlHelper
    
    before_action :set_locale
    before_action :load_contacts
    before_action :load_shopping_cart

    before_action :set_user_to_shopping_cart

private




    def load_contacts
        @contact = Contact.last
    end

    def set_locale
    	#I18n.locale = params[:locale] || I18n.default_locale
        I18n.locale = params.fetch(:locale, I18n.default_locale).to_sym
    end

    def default_url_options(options = {})
    	{locale: I18n.locale}.merge options
    end
    #def default_url_options
    #    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
    #end

    def load_shopping_cart
        if session[:shopping_cart_id]
          @shopping_cart = ShoppingCart.find(session[:shopping_cart_id]) 
        else
          @shopping_cart = ShoppingCart.create
          session[:shopping_cart_id] = @shopping_cart.id
        end
    end

    def set_user_to_shopping_cart
        if @shopping_cart.present? and @shopping_cart.user_id.nil? and current_user.present?
            @shopping_cart.update_column(:user_id, current_user.id)
        end
    end
end
