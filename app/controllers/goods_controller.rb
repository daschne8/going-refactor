class GoodsController < ApplicationController

def index
  redirect_to root_path
end

  def create
    @good = Good.create(good_params)
    @good.save
    render json: @good
  end

  def goods_data
    if !params["select-tag"]
      @goods = Good.all
    else
      @goods,@filter = Tag.find_tag(params["select-tag"])
    end
    render json: @goods, each_serializer: GoodSerializer
  end


  def show
    @good = Good.find_by(id: params[:id])
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @good, status: 200}
    end
  end

  def edit
    @good = Good.find_by(id: params[:id])
    @occupant = current_occupant
  end

  def update
    good = Good.find_by(id: params[:id])
    if good.update(good_params)
      redirect_to goods_path(good)
    else
      redirect_to edit_good_path(good)
    end
  end

  def destroy
    occupant = current_occupant
    Good.find_by(id: params[:id]).destroy
    #redirect_back(fallback_location: root_path)
  end

  private

  def good_params
    params.require(:good).permit(:name, :occupant_id, :description, tag_ids:[], tags_attributes: [:name])
  end

end
