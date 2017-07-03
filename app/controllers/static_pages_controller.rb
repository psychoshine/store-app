class StaticPagesController < ApplicationController
  def main_page
  	if current_user.present?
  		@shopping_carts = current_user.shopping_carts.paginate(:page => params[:page], :per_page => 20)
  	else
  		redirect_to login_path
  	end
  end
end
