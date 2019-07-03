class SessionsController < ApplicationController
  #skip_before_action :authenticate_user, only: [:create, :create_git, :new]

  def authenticate
    authenticate_user
  end

  def create_git

    response = Faraday.post "https://github.com/login/oauth/access_token", {client_id: ENV["GITHUB_CLIENT"], client_secret: ENV["GITHUB_SECRET"],code: params[:code]}, {'Accept' => 'application/json'}
    access_hash = JSON.parse(response.body)
    session[:token] = access_hash["access_token"]

    user_response = Faraday.get "https://api.github.com/user", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    user_json = JSON.parse(user_response.body)

    occupant = Occupant.find_or_create_by(name: user_json["login"])
    #bcrypt hack
    occupant.password_digest = "password"
    occupant.establishment = Establishment.first
    occupant.save
    session[:occupant_id] = occupant.id
    redirect_to establishment_path(occupant.establishment)
  end

  def create
    occupant = Occupant.find_by(name: session_params[:name])
    if occupant && occupant.authenticate(session_params[:password])
      flash[:success] = "Succesfully Logged In"
      session[:occupant_id] = occupant.id
      if occupant.admin == true
        redirect_to displays_path
      else
        redirect_to establishment_occupant_path(occupant.establishment,occupant)
      end
    else
      flash[:warning] = "Invalid username/password"
      return redirect_to login_path
    end
  end

  def destroy
    reset_session
    flash[:success] = "You have been Logged Out."
    redirect_to login_path
  end


  def new
    @occupant = Occupant.new
  end



  # def destroy
  #   session.delete :occupant_id
  #   flash[:success] = "You have been Logged Out."
  #   redirect_to login_path
  # end
  #
  private

  def session_params
    params.require(:occupant).permit(:name, :password)
  end

end
