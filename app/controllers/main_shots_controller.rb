class MainShotsController < ApplicationController
  before_action :set_main_shot, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy, :show]

  def index
    @main_shots = MainShot.all
  end


  def show
  end

 
  def new
    @main_shot = MainShot.new
  end


  def edit
  end

  def create
    @main_shot = MainShot.new(main_shot_params)

    respond_to do |format|
      if @main_shot.save
        format.html { redirect_to main_shots_path, notice: 'Main shot was successfully created.' }
       
      else
        format.html { render :new }
       
      end
    end
  end

  def update
    respond_to do |format|
      if @main_shot.update(main_shot_params)
        format.html { redirect_to @main_shot, notice: 'Main shot was successfully updated.' }
       
      else
        format.html { render :edit }
        
      end
    end
  end

  def destroy
    @main_shot.photo = nil
    @main_shot.save
    @main_shot.destroy
    respond_to do |format|
      format.html { redirect_to main_shots_url, notice: 'Main shot was successfully destroyed.' }
     
    end
  end

  private
 
    def set_main_shot
      @main_shot = MainShot.find(params[:id])
    end
    def admin_user
      redirect_to(main_shots_path) unless current_user.present? and current_user.admin?
    end

    def main_shot_params
      params.require(:main_shot).permit(:title, :description, :photo, :title2, :description2)
    end
end
