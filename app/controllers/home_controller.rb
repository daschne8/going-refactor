class HomeController < ApplicationController
  before_action :needs_login?

  def show
    @occupant = Occupant.find_by(id: session[:occupant_id])
    @establishment = @occupant.establishment
    @tags = Tag.all
    #@goods = @establishment.goods
    @good = Good.new
  end

  private

  def needs_login?
    redirect_to login_path unless logged_in?
  end

end
