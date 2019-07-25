class OccupantsController < ApplicationController

  before_action :require_logged_in, only: [:show]

  def new
    @occupant = Occupant.new
  end

  def show
    is_current_occupant?
    @tags = Tag.all
    @occupant = Occupant.find_by(id: params[:id])
    @establishment = @occupant.establishment
    @good = Good.new
    if !params[:tag].blank?
      tag = Tag.find_by(id: params[:tag])
      @goods = tag.goods
      @filter = "Filtered by tag, #{tag.name}"
    else
      @goods = Good.all
    end
  end

  def create
    occupant = Occupant.new(occupant_params)
    occupant.establishment = Establishment.first
    if occupant.save
      session[:occupant_id] = occupant.id
      flash[:success] = "Successfully created User!"
      redirect_to root_path
    else
      flash[:warning] = "Invalid name or passwords don't match"
      redirect_to new_occupant_path
    end
  end

  def destroy
    if is_admin?
      occupant = Occupant.find_by(id: params[:id]).destroy
    else
      flash[:error] = "Unable to delete user"
    end
    redirect_back(fallback_location: displays_path)
  end

  private

  def occupant_params
    params.require(:occupant).permit(:name, :password, :password_confirmation)
  end


end
